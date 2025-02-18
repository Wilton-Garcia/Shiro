//
//  Profile.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import Foundation

struct Profile: Codable {
    let id: UUID
    var name: String
    var email: String
    var bio: String?
    
    // Initializer
    init(id: UUID = UUID(), name: String, email: String, bio: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.bio = bio
    }
}
