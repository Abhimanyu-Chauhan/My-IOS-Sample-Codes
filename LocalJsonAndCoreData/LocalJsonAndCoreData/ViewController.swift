//
//  ViewController.swift
//  LocalJsonAndCoreData
//
//  Created by Abhimanyu Kumar Chauhan on 02/12/18.
//  Copyright © 2018 Abhimanyu Kumar Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var employeeObj: Employee?
    var persons: [Person]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        self.loadJsonFile()
        self.loadAndParseLocalJson()
    }

    func loadJsonFile(){
        if let path = Bundle.main.path(forResource: "codebeautify", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                    // do stuff
                }
            } catch {
                // handle error
            }
        }
    }
    
    func loadAndParseLocalJson(){
        
        let path = Bundle.main.path(forResource: "codebeautify", ofType: "json")
        
        do{

            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            
            let obj = try JSONDecoder().decode(Employee.self, from: data)
            employeeObj = obj
            self.saveDataToCoreData()
            
        }
        catch{
            
        }
    }
    
    func saveDataToCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Delete old values
        let fetchRequest = Person.fetchRequestForPerson()
        persons = try? context.fetch(fetchRequest)
        for person in persons!{
            context.delete(person)
        }
        for employee in (employeeObj?.employee)!{
            let person = Person(context: context)
            person.firstName = employee.firstName
            person.lastName = employee.lastName
            
            for addr in employee.address{
                let address = Address(context: context)
                address.city = addr.city
                address.state = addr.state
                address.street = addr.street
                address.personRelation = person
                print(address.city!)
            }
            
        }
        
        do{
            try? context.save()
        }
        catch{
            print("Error while saving")
        }

       self.retrieveDataFromCoreData()
        
    }
    
    func retrieveDataFromCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = Person.fetchRequestForPerson()
        let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        //fetchRequest.predicate = NSPredicate(format: "visited == true")
        persons = try? context.fetch(fetchRequest)
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (persons?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        
        let person = self.persons![indexPath.row]
        cell.firstNameLabel.text = person.firstName
        //print(person.addressDetailRelation!)
        var addressFullText = ""
        for address in person.addressDetailRelation!{
            let addr = address as! Address
            print(addr.city!)
            addressFullText = addressFullText + addr.city! + addr.state! + addr.street! + ":::"
        }
        cell.addressLabel.text = addressFullText
        
        return cell
    }
    
    
}

