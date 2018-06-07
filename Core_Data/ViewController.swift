//
//  ViewController.swift
//  Core_Data
//
//  Created by Anmol's Macbook Air on 07/06/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var friends : [Friends]? = nil
    
    @IBOutlet weak var firstName: UILabel?
    @IBOutlet weak var lastName: UILabel?
    @IBOutlet weak var age: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstName?.text = "Arun"
        lastName?.text = "Kumar"
        age.text = "23"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        
        let bool = CoreDataHandler.saveObject(firstName: (firstName?.text)!, lastName: (lastName?.text)!, number:Int64(age.text!)!)
        if bool == true{
            
            print("Successfully Saved")
        }
    }
    
    @IBAction func fetchResult(_ sender: UIButton) {
        
        friends = CoreDataHandler.fetchObject()
        
        for i in friends! {
            
            print("First Name = \(String(describing: i.firstname)), Last Name = \(String(describing: i.lastname)), Age = \(i.number)")
        }
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        
        friends = CoreDataHandler.fetchObject()
        if (friends?.count)! > 0 {
            
            if CoreDataHandler.deleteObject(friend: friends![0]) {
                
                friends = CoreDataHandler.fetchObject()
                for i in friends! {
                    
                    print("First Name = \(String(describing: i.firstname)), Last Name = \(String(describing: i.lastname)), Age = \(i.number)")
                }
            }
        }
    }
    
    @IBAction func clearData(_ sender: UIButton) {
        
        friends = CoreDataHandler.fetchObject()
        print(friends?.count ?? "")
        if CoreDataHandler.cleanData() {
            
            friends = CoreDataHandler.fetchObject()
            print(friends?.count ?? "")
        }
    }
}


