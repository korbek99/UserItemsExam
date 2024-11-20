//
//  UserDetailViewController.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import UIKit

class UserDetailViewController: UIViewController {
    private let user: User
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.frame = view.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.frame = view.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.frame = view.bounds
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = user.name
        setupUX()
        loadData()

    }
    
    func setupUX() {
        
        view.backgroundColor = .white
        view.addSubview(labelName)
        view.addSubview(labelUserName)
        view.addSubview(labelEmail)
        
        labelName.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        labelName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        labelUserName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20).isActive = true
        labelUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        labelEmail.topAnchor.constraint(equalTo: labelUserName.bottomAnchor, constant: 20).isActive = true
        labelEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func loadData(){
        labelName.text = "Name: \(user.name)"
        labelUserName.text = "User: \(user.id)"
        labelEmail.text = "Email: \(user.email)"
    }
}

