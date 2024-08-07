//
//  GithubUsersData.swift
//  tawkAssignment
//
//  Created by Saqib Bhatti on 7/8/24.
//

import Foundation


protocol GithubUsersData {
    var login: String { get }
    var id: Int { get }
    var avatar_url: String { get }
    var html_url: String { get }
}
