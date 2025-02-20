//
//  ProfileDataManager.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import Foundation

protocol ProfileDataManagerProtocol {
    func saveProfile(_ profile: Profile) throws
    func fetchProfile() throws -> Profile
    func deleteProfile()
}
