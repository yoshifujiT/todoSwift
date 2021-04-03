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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell");
        view.addSubview(tableView);

        view.backgroundColor = .white;
    }

    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        // TODO: should impl
        print("tapped");
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

