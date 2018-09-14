//
//  ViewController.swift
//  CoreData Demo
//
//  Created by Mohamed Salah Zidane on 8/3/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        /*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
       
        newUser.setValue("khaled", forKey: "username")
        newUser.setValue("pass", forKey: "password")
        newUser.setValue (22, forKey: "age")
        do {
            try context.save()
            print("saved")
        }catch{
            print("there is an error")
        }
        */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
      //  request.predicate = NSPredicate(format: "username = %@", "kamal")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result  in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String{
                       /* context.delete(result)
                        do{
                            try context.save()
                        }catch{
                            print("Delete failed")
                        }*/                    /*
                        result.setValue("kamal", forKey: "username")
                        do{
                            try context.save()
                        }catch{
                            print("rename failed")
                        }  */
                      print(username)
                    }
                }
            }else{
                print("No results")
            }
        }catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

