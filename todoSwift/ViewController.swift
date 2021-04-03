//
//  ViewController.swift
//  todoSwift
//
//  Created by ToruYoshifuji on 2021/04/04.
//

import UIKit

class ViewController: UIViewController {

    var addBarButtonItem: UIBarButtonItem!;

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

        view.backgroundColor = .white;
    }

    @objc func addBarButtonTapped(_ sender: UIBarButtonItem) {
        // TODO: should impl
        print("tapped");
    }


}

