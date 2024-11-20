//
//  AppCoordinator.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let userViewModel = UserViewModel()
        let userListVC = UserListViewController(viewModel: userViewModel)
        userListVC.onUserSelected = { user in
            self.showUserDetail(user)
        }
        
        userViewModel.onError = { [weak self] error in
                    self?.showErrorViewController(with: error)
        }
        navigationController.pushViewController(userListVC, animated: true)
    }

    func showUserDetail(_ user: User) {
        let userDetailVC = UserDetailViewController(user: user)
        navigationController.pushViewController(userDetailVC, animated: true)
    }
    
    func showErrorViewController(with error: Error) {
            let errorViewController = ErrorViewController()
            errorViewController.errorMessage = error.localizedDescription
            navigationController.pushViewController(errorViewController, animated: true)
    }
}
