//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by 김희진 on 2022/06/04.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            self.saveCategories()
        }
        
        alert.addAction(action)
        alert.addTextField { field in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListTableViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategotry = categories[indexPath.row]
        }
    }
    
    func saveCategories(){
        do {
            try context.save()
        }catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        let requset: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(requset)
        }catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
}
