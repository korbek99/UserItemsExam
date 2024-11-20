//
//  UserViewModel.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import Foundation
class UserViewModel {
    private var users: [User] = []
    var reloadData: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    var numberOfUsers: Int {
        users.count
    }
    
    func user(at index: Int) -> User {
        users[index]
    }
    
    func fetchUsers() {
        ApiService.shared.fetchUsers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.reloadData?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.onError?(error) 
                }
            }
        }
    }
}

