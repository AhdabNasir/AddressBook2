//
//  AddViewController.swift
//  AddressBook
//
//  Created by Ahdab Nasir on 16/07/2016.
//  Copyright © 2016 Ahdab Nasir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class AddViewController: UIViewController {
    
    var people = [NSManagedObject]()
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
   }
    
    
    @IBAction func createBtn(sender: UIButton) {
        
        var nameText = ""
        var addressText = ""
        var numberText = ""
        
        nameText = nameField.text!
        addressText = addressField.text!
        numberText = numberField.text!
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        user.setValue(nameText, forKey: "name")
        user.setValue(addressText, forKey: "address")
        user.setValue(numberText, forKey: "number")
        user.setValue(NSDate(), forKey: "date")
        
        do {
            try managedContext.save()
            
            people.append(user)
        }
        
        catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
}
