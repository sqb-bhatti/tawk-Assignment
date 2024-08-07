//
//  UsersListViewModel.swift
//  tawkAssignment
//
//  Created by Saqib Bhatti on 6/8/24.
//

import Foundation


class UsersListViewModel {
    
    enum UsersDataError: Error {
        case noUserDataAvailable
    }
    
    typealias DidFetchGithubUsersCompletion = (([GithubUsersData]?, UsersDataError?) -> Void)
    var didFetchGithubUsers: DidFetchGithubUsersCompletion?
    
    
    init() {
        fetchGithubUsersData()
    }
    
    
    private func fetchGithubUsersData() {
        URLSession.shared.dataTask(with: UserService.baseUrl) { [weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            if let error = error {
                print("Unable to fetch weather data \(error)")
                self?.didFetchGithubUsers?(nil, .noUserDataAvailable)
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let userListResponse = try decoder.decode([UsersListResponse].self, from: data)
                    self?.didFetchGithubUsers?(userListResponse, nil)
                } catch {
                    print("Unable to decode JSON response \(error)")
                    self?.didFetchGithubUsers?(nil, .noUserDataAvailable)
                }
            } else {
                self?.didFetchGithubUsers?(nil, .noUserDataAvailable)
            }
        } .resume()
    }
}
