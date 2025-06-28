//
//  ViewController.swift
//  myTherapy
//
//  Created by Karina Osadchaya on 11/1/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var savedMinds: [SavedMinds] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SavedMinds> = SavedMinds.fetchRequest()
        
        do {
            savedMinds = try context.fetch(fetchRequest)
            //sortMinds()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addMind(withTitle: "fourth")
        //addMind(withTitle: "second")
        //addMind(withTitle: "third")
        //deleteMinds()
        
        print(savedMinds.count)
        printMinds()
        
        /*SavedMindsOLD.answeredMind = AnswerMindClass.init(name: "first")
        print(SavedMindsOLD.answeredMind.hour, ":",
              SavedMindsOLD.answeredMind.minute, ":",
              SavedMindsOLD.answeredMind.second, SavedMindsOLD.answeredMind.name
        )
        */
    }
    
//MARK: - working with Minds
    
    func addMind(withTitle mindTitle: String ) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "SavedMinds", in: context) else { return }
        
        let singleMind = SavedMinds(entity: entity, insertInto: context)
        singleMind.nameShortened = mindTitle
        singleMind.index = Int16(savedMinds.count)
        singleMind.date = Date.now
        
        do {
            try context.save()
            savedMinds.insert(singleMind, at: 0)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    func printMinds() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SavedMinds> = SavedMinds.fetchRequest()
        
        do {
            savedMinds = try context.fetch(fetchRequest)
            
            for mind in savedMinds {
                print(mind.index, " ", mind.nameShortened, " ", mind.date)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func sortMinds() {
        for i in (0...savedMinds.count-2) {
            for j in (i+1...savedMinds.count-1) {
                if savedMinds[i].index < savedMinds[j].index {
                    let buff = savedMinds[i]
                    savedMinds[i] = savedMinds[j]
                    savedMinds[j] = buff
                }
            }
        }
    }//end sortMinds
    
    func deleteMinds() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SavedMinds> = SavedMinds.fetchRequest()
        
        if let savedMinds = try? context.fetch(fetchRequest) {
            for mind in savedMinds {
                context.delete(mind)
            }
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }//end deleteMinds
}

