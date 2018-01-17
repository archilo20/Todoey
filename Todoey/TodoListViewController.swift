//
//  ViewController.swift
//  Todoey
//
//  Created by Fernando Archila on 1/16/18.
//  Copyright © 2018 Fernando Archila. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["One","Two","Three"]
    override func viewDidLoad() {
        super.viewDidLoad()
         }

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    //MARK -- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    //MARK -- Add button
    
    @IBAction func AddAction(_ sender: Any)
    {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            self.itemArray.append(textfield.text!)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Todo item"
            textfield=alertTextField
        }
        
        present(alert, animated: true,completion: nil)
        
    }
    
}

