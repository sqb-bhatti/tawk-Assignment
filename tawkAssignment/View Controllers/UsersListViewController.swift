//
//  UsersListViewController.swift
//  tawkAssignment
//
//  Created by Saqib Bhatti on 6/8/24.
//

import UIKit

final class UsersListViewController: UIViewController {

    private enum AlertType {
        case noUserDataAvailable
    }
    
    // MARK: - Properties
    var viewModel: UsersListViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupViewModel(with: UsersListViewModel) {
        viewModel?.didFetchGithubUsers = { [weak self] (data, error) in
            if let _ = error {
                self?.presentAlert(of: .noUserDataAvailable)
            } else if let data = data {
                print(data)
            } else {
                self?.presentAlert(of: .noUserDataAvailable)
            }
        }
    }
    
    private func presentAlert(of alertType: AlertType) {
        let title: String
        let message: String
        
        switch alertType {
        case .noUserDataAvailable:
            title = "Unable to fetch Users Data"
            message = "The application is unable to fetch users data. Please make sure your device is connected over Wi-Fi or cellular."
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

