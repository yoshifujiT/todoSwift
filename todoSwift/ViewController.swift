//
//  ViewController.swift
//  todoSwift
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import UIKit

class ViewController: UIViewController {

    private var addBarButtonItem: UIBarButtonItem!;
    private var tableView = UITableView();
    private var todoList = [String]();
    private let userDefaults = UserDefaults.standard;

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ToDoリスト";
        navigationController?.navigationBar.barTintColor = .orange;
        navigationController?.navigationBar.tintColor = .white;
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ];

        addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped(_:)))
        navigationItem.rightBarButtonItems = [addBarButtonItem];

        tableView.frame = view.bounds;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell");
        view.addSubview(tableView);

        view.backgroundColor = .white;

        if let storedDataList = userDefaults.array(forKey: "todoList") as? [String] {
            todoList.append(contentsOf: storedDataList);
        }
    }

    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add ToDo", message: "ToDoを入力してください", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)

        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                self.todoList.insert(textField.text!, at: 0);
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right);
                self.userDefaults.set(self.todoList, forKey: "todoList");
            }
        }
        alertController.addAction(okAction);

        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil);
        alertController.addAction(cancelButton);

        present(alertController, animated: true, completion: nil);
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath);
        let todoTitle = todoList[indexPath.row];
        cell.textLabel?.text = todoTitle;
        return cell;
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic);
            self.userDefaults.set(todoList, forKey: "todoList");
        }
    }
}

