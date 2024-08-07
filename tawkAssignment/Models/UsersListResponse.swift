//
//  UsersListResponse.swift
//  tawkAssignment
//
//  Created by Saqib Bhatti on 6/8/24.
//

import Foundation


struct UsersListResponse: Codable {
    let login: String
    let id: Int
    let avatar_url: String
    let html_url: String
}



extension UsersListResponse: GithubUsersData {
    
}
