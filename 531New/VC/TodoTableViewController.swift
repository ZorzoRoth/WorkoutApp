//
//  TodoTableViewController.swift
//  531New
//
//  Created by Zoltan Puchovsky on 21/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var resultsController: NSFetchedResultsController<Todo>!
    let coreDataStack = CoreDataStack()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "date", ascending: true)
        
        // Init
        request.sortDescriptors = [sortDescriptors]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        // Fetch
        do {
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsController.sections?[section].objects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        // Configure the cell...
        let todo = resultsController.object(at: indexPath)
        cell.textLabel?.text = todo.title
        
        return cell
    }
    
    // MARK - Table view delegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completeion) in
            // TODO: Delete todo
            completeion(true)
        }
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Check") { (action, view, completeion) in
            // TODO: Delete todo
            completeion(true)
        }
        action.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? ViewController {
            vc.managedContext = coreDataStack.managedContext
        }
    }
    

}
