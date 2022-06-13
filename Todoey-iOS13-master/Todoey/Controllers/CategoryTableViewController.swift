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

class CategoryTableViewController: UITableViewController {

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
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
//            let newCategory = Category(context: self.context)

            let newCategory = Category3()
            newCategory.name = textField.text!
            

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category"
        
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
    
}
