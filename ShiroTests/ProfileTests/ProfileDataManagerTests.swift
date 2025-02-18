//
//  ProfileTestes.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import XCTest
@testable import Shiro

class ProfileDataManagerTests: XCTestCase {
    var dataManager: ProfileDataManagerProtocol!
    
    override func setUp() {
        super.setUp()
        dataManager = ProfileDataManager()
    }
    
    override func tearDown() {
        // Limpa o UserDefaults após cada teste
        dataManager.deleteProfile()
        super.tearDown()
    }
    
    func testSaveAndFetchProfile() {
        // Cria um perfil
        let profile = Profile(name: "Maria Oliveira", email: "maria.oliveira@example.com")
        
        // Salva o perfil
        do {
            try dataManager.saveProfile(profile)
        } catch {
            XCTFail("Falha ao salvar o perfil: \(error)")
        }
        
        // Recupera o perfil
        do {
            let savedProfile = try dataManager.fetchProfile()
            XCTAssertEqual(savedProfile.name, "Maria Oliveira")
            XCTAssertEqual(savedProfile.email, "maria.oliveira@example.com")
        } catch {
            XCTFail("Falha ao recuperar o perfil: \(error)")
        }
    }
    
    func testDeleteProfile() {
        // Cria um perfil
        let profile = Profile(name: "Carlos Souza", email: "carlos.souza@example.com")
        
        // Salva o perfil
        do {
            try dataManager.saveProfile(profile)
        } catch {
            XCTFail("Falha ao salvar o perfil: \(error)")
        }
        
        // Exclui o perfil
        dataManager.deleteProfile()
        
        // Tenta recuperar o perfil (deve falhar)
        XCTAssertThrowsError(try dataManager.fetchProfile()) { error in
            XCTAssertEqual(error as? ProfileDataError, ProfileDataError.profileNotFound)
        }
    }
}
