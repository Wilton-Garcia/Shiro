//
//  ProfileUseCaseTests.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import XCTest
@testable import Shiro 
class ProfileUseCaseTests: XCTestCase {
    var useCase: ProfileUseCase!
    var mockDataManager: MockProfileDataManager!
    
    override func setUp() {
        super.setUp()
        mockDataManager = MockProfileDataManager()
        useCase = ProfileUseCase(dataManager: mockDataManager)
    }
    
    override func tearDown() {
        useCase = nil
        mockDataManager = nil
        super.tearDown()
    }
    
    func testFetchProfileSuccess() {
        // Configura o mock para retornar um perfil
        let mockProfile = Profile(name: "Test User", email: "test@example.com")
        mockDataManager.profileToReturn = mockProfile
        
        // Executa o Use Case
        useCase.fetchProfile { result in
            switch result {
            case .success(let profile):
                XCTAssertEqual(profile.name, "Test User")
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }
    
    func testUpdateProfileSuccess() {
        // Cria um perfil para atualizar
        let profile = Profile(name: "Updated User", email: "updated@example.com")
        
        // Executa o Use Case
        useCase.updateProfile(profile) { result in
            switch result {
            case .success(let updatedProfile):
                XCTAssertEqual(updatedProfile.name, "Updated User")
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }
    
    func testDeleteProfileSuccess() {
        // Executa o Use Case
        useCase.deleteProfile { result in
            switch result {
            case .success:
                XCTAssertTrue(true) // Sucesso
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }
}
