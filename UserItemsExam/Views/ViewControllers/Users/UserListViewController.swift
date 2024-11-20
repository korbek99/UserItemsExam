//
//  UserListViewController.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import UIKit

class UserListViewController: UIViewController {
    private let viewModel: UserViewModel
   
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.bounds
        table.dataSource = self
        table.delegate = self
        table.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    var onUserSelected: ((User) -> Void)?

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchUsers()
    }

    private func setupUI() {
        title = "Users"
        view.backgroundColor = .white
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

    }
    
    func setupUX() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
   
        
    }

    private func bindViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfUsers
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
                fatalError("Could not dequeue cell with identifier: UserTableViewCell")
            }
        let user = viewModel.user(at: indexPath.row)
        cell.textLabel?.text = user.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.user(at: indexPath.row)
        onUserSelected?(user)
    }
}
