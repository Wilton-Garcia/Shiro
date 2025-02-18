//
//  ProfileDataManagerImpl.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import Foundation

import Foundation

class ProfileDataManager: ProfileDataManagerProtocol {
    private let profileKey = "userProfile"
    
    func saveProfile(_ profile: Profile) throws {
        let encoder = JSONEncoder()
        do {
            let encodedData = try encoder.encode(profile)
            UserDefaults.standard.set(encodedData, forKey: profileKey)
        } catch {
            throw ProfileDataError.failedToEncodeProfile
        }
    }
    
    func fetchProfile() throws -> Profile {
        guard let savedData = UserDefaults.standard.data(forKey: profileKey) else {
            throw ProfileDataError.profileNotFound
        }
        
        let decoder = JSONDecoder()
        do {
            let profile = try decoder.decode(Profile.self, from: savedData)
            return profile
        } catch {
            throw ProfileDataError.failedToDecodeProfile
        }
    }
    
    // Remover o perfil do UserDefaults
    func deleteProfile() {
        UserDefaults.standard.removeObject(forKey: profileKey)
    }
}

// MARK: - Erros personalizados
enum ProfileDataError: Error {
    case failedToEncodeProfile
    case failedToDecodeProfile
    case profileNotFound
}
