//
//  SourcesViewController.swift
//  Badminton_Management
//
//  Created by Stephen003 on 2023/9/27.
//

import UIKit
import CoreData

// MARK: 首頁

protocol SourcesViewControllerDelegate: AnyObject {
    func sourcesViewController(_ controller: SourcesViewController)
}

final class SourcesViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: SourcesViewControllerDelegate?

    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("首頁出現")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - Action

extension SourcesViewController {
    
    @IBAction func create(_ : Any) {
        newData()
    }
    
    @IBAction func loadAction(_ : Any) {
        loadData()
    }
    
    @IBAction func editAction(_ sender: Any) {
        editData()
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        deleteData()
    }
    
    @IBAction func editNumberAction(_ sender: Any) {
        editNumberData()
    }
    
    func newData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let event = NSEntityDescription.insertNewObject(forEntityName: "Events", into: context) as! Events
        let playingFields = NSEntityDescription.insertNewObject(forEntityName: "PlayingFields", into: context) as! PlayingFields
        let players = NSEntityDescription.insertNewObject(forEntityName: "Players", into: context) as! Players
        
        playingFields.id = 1
        playingFields.name = "A場"
        playingFields.timestamp = Date()
        players.id = 1
        players.name = "Mike"
        players.timestamp = Date()
        players.playedTimes = 1
        players.restNmber = 1
        players.hasPaid = false
        event.id = 1
        event.name = "20230928上午"
        event.playingFields = [playingFields]
        event.players = [players]
        
        do {
            try context.save()
        } catch let saveError {
            fatalError("\(saveError)")
        }
    }
    
    func newPlayers(name: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let players = NSEntityDescription.insertNewObject(forEntityName: "Players", into: context) as! Players
        players.id = 1
        players.name = "Mike"
        players.timestamp = Date()
        players.playedTimes = 1
        players.restNmber = 1
        players.hasPaid = false
        do {
            try context.save()
        } catch let saveError {
            fatalError("\(saveError)")
        }
    }
    
    func loadData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<Events>(entityName: "Events")
        
        do {
            let results = try context.fetch(request)
            print("count: \(results.count)")
            for result in results {
                print("result: \(result)")
                print("result id: \(result.id)")
                print("result name: \(result.name)")
            }
        } catch let loadError {
            fatalError("讀取錯誤：\(loadError)")
        }
    }
    
    func editData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<Events>(entityName: "Events")
        
        // TODO: 字串與integer 的差別
        request.predicate = NSPredicate(format: "name == %@", "20230928上午")
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                let event = results[0]
                event.name = "20230928下午"
                try context.save()
            }
        } catch let editError {
            fatalError("EDIT ERROR: \(editError)")
        }
    }
    
    func editNumberData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<Events>(entityName: "Events")
        
        // TODO: 字串與integer 的差別
        request.predicate = NSPredicate(format: "id == 1") // int 也可以這樣判斷
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                let event = results[0]
                event.id = 11
                try context.save()
            }
        } catch let editError {
            fatalError("EDIT/SAVE ERROR: \(editError)")
        }
    }
    
    func deleteData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<Events>(entityName: "Events")
        request.predicate = NSPredicate(format: "name == %@", "20230928上午")
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                let event = results[0]
                context.delete(event)
            }
        } catch let editError {
            fatalError("EDIT ERROR: \(editError)")
        }
    }
}
