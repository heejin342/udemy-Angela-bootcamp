//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {

    var itemArray = [Item]()
    
    var selectedCategotry: Category? {
        didSet{
            loadItems()
        }
    }

    // 기존 userDefaults. userDefualt.plist 형태로 앱 내에 저장된다.
    // let defaults = UserDefaults.standard
    
    // item.plist라는 커스텀 싱글톤 파일. 기존 userDefault 와는 다르게 다양한 타입이 저장 가능하다
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//    let realmPasth = Realm.Configuration.defaultConfiguration.fileURL
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(dataFilePath)
//        print(realmPath!)

        
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Buy Egges"
//        itemArray.append(newItem2)
//
//
//        let newItem3 = Item()
//        newItem3.title = "Destroy Demon"
//        itemArray.append(newItem3)

        
//        if let item = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = item
//        }
        
        
// 뷰컨에서 델리게이트 명시해줌
//        searchBar.delegate = self

//        loadItems()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 재사용이 안되는 셀. 체크를 하고 내려도 체크 안된채로 보인다.
        // let cell = UITableViewCell(style: .default, reuseIdentifier: "TodoItemCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "TotoItemCell", for: indexPath)

        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title

        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        itemArray[indexPath.row].setValue("completed", forKey: "title")

// 데이터 삭제됨
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
 
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add net todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in

            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            newItem.parentCategory = self.selectedCategotry
            self.itemArray.append(newItem)
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.saveItems()
        }
        
        alert.addTextField { tf in
            tf.placeholder = "Create new item"
            textField = tf
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    func saveItems(){

//        let encoder = PropertyListEncoder()
        do {
//            let data = try encoder.encode(self.itemArray)
//            try data.write(to: self.dataFilePath!)
            
            try context.save()
    
        }catch {
            print("Error endcoding \(error)")
        }

        self.tableView.reloadData()
    }

    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            }catch {
//                print(error)
//            }
//        }

        
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategotry!.name!)

        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        }else {
            request.predicate = categoryPredicate
        }
        
        do {
            itemArray = try context.fetch(request)
        }catch {
            print("Error fetchin data from context \(error)")
        }
        
        tableView.reloadData()
    }
}

extension TodoListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
                
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]

        loadItems(with: request, predicate: predicate)
//        do {
//            itemArray = try context.fetch(request)
//        }catch {
//            print("Error fetchin data from context \(error)")
//        }
//        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()

            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }

}
