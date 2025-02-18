//
//  DataManagerMock.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

@testable import Shiro

class MockProfileDataManager: ProfileDataManagerProtocol {
    var profileToReturn: Profile?
    var errorToThrow: Error?
    
    func saveProfile(_ profile: Profile) throws {
        if let error = errorToThrow {
            throw error
        }
        // Simula o salvamento do perfil
    }
    
    func fetchProfile() throws -> Profile {
        if let error = errorToThrow {
            throw error
        }
        guard let profile = profileToReturn else {
            throw ProfileDataError.profileNotFound
        }
        return profile
    }
    
    func deleteProfile() {
        // Simula a exclusão do perfil
    }
}
