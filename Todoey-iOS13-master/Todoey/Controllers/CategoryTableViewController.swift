//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by 김희진 on 2022/06/04.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import ChameleonFramework

class CategoryTableViewController: SwipeTableViewController {

    let realm = try! Realm()

//    var categories = [Category]()
    var categories: Results<Category3>?

    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//        let realmURLs = [
//                         realmURL,
//                         realmURL.appendingPathExtension("lock"),
//                         realmURL.appendingPathExtension("note"),
//                         realmURL.appendingPathExtension("management")
//        ]
//        for URL in realmURLs {
//            do {
//                try FileManager.default.removeItem(at: URL)
//            } catch {}
            
        
        loadCategories()
        tableView.separatorStyle = .none
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
//            let newCategory = Category(context: self.context)

            let newCategory = Category3()
            newCategory.name = textField.text!
            newCategory.colour = UIColor.randomFlat().hexValue()

//            self.categories.append(newCategory)
//            self.saveCategories()
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        alert.addTextField { field in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let categories = categories?[indexPath.row] {
            cell.textLabel?.text = categories.name

            guard let categoryColot = UIColor(hexString: categories.colour) else { fatalError() }
            cell.backgroundColor = categoryColot
            cell.textLabel?.textColor = ContrastColorOf(categoryColot, returnFlat: true)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListTableViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategotry = categories?[indexPath.row]
        }
    }
    
//    func saveCategories(){
//        do {
//            try context.save()
//        }catch {
//            print(error)
//        }
//        tableView.reloadData()
//    }
    
    func save(category: Category3){
        do {
            try realm.write {
                realm.add(category)
            }
        }catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
//    func loadCategories() {
//        let requset: NSFetchRequest<Category> = Category.fetchRequest()
//        
//        do {
//            categories = try context.fetch(requset)
//        }catch {
//            print(error)
//        }
//        tableView.reloadData()
//    }
    
    func loadCategories() {
        categories = realm.objects(Category3.self)
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        super.updateModel(at: indexPath)
        
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            }catch {
                print(error)
            }
        }
    }
    
}
//
//extension CategoryTableViewController: SwipeTableViewCellDelegate {
//
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//
//        guard orientation == .right else { return nil }
//
//        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
//            if let categoryForDeletion = self.categories?[indexPath.row] {
//                do {
//                    try self.realm.write {
//                        self.realm.delete(categoryForDeletion)
//                    }
//                }catch {
//                    print(error)
//                }
//            }
//        }
//
//        deleteAction.image = UIImage(named: "delete-icon")
//
//        return [deleteAction]
//    }
//
//    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
//        var options = SwipeOptions()
//        options.expansionStyle = .destructive
//        return options
//    }
//}
