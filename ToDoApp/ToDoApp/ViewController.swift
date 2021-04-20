//
//  ViewController.swift
//  ToDoApp
//
//  Created by Daye on 2021/04/20.
//

import UIKit

/*
 
 - To show list of current to do list items
 - To enter new to do list items
 - To show previously entered to do list item
 
 - Item
 - Date
 
 */

struct Todo {
    var work: String
    var date: Date
}

class ViewController: UITableViewController {

    
    fileprivate let cellID = "cellID"
    fileprivate var todos:[Todo] = [
        Todo(work: "This is a todo", date: Date())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector((AddBtn)))
    }
    
    @objc func AddBtn(){
        let alert = UIAlertController(title: "Add your to do work", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a todo"
        }
        alert.addAction(UIAlertAction(title: "Add note", style: .default, handler: {(action) in
            guard let textField = alert.textFields?.first else { return }
            guard let text = textField.text else { return }
            guard text != "" else { return }
            self.todos.append(Todo(work: text, date: Date()))
            self.tableView.beginUpdates()
            let indexPath = IndexPath(row: self.todos.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            
            self.save()
        }))
        
        present(alert, animated: true)
        
    }
    
    func save() {
        var todosToBeSaved: [String] = []
        var datesToBeSaved: [Date] = []
        for todo in todos {
            todosToBeSaved.append(todo.work)
            datesToBeSaved.append(todo.date)
        }
        UserDefaults.standard.set(todosToBeSaved, forKey: "work")
        UserDefaults.standard.set(datesToBeSaved, forKey: "date")
    }
    
    func retriveTodos() {
        guard let savedTodos = UserDefaults.standard.object(forKey: "work") as? [String] else {
            return
        }
        print(savedTodos)
    }
    
    func formatDate(date: Date, format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = todos[indexPath.row].work
        cell.detailTextLabel?.text = formatDate(date: Date(), format: "YYYY-MM-dd hh:mm:ss")
        return cell
    }

}

