//
//  ProfileUseCase.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//



import Foundation

import Foundation

class ProfileUseCase: ProfileUseCaseProtocol {
    private let dataManager: ProfileDataManagerProtocol
    
    // Injeção de dependência via inicializador
    init(dataManager: ProfileDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    // Busca o perfil
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        do {
            let profile = try dataManager.fetchProfile()
            completion(.success(profile))
        } catch {
            completion(.failure(error))
        }
    }
    
    // Atualiza o perfil
    func updateProfile(_ profile: Profile, completion: @escaping (Result<Profile, Error>) -> Void) {
        do {
            try dataManager.saveProfile(profile)
            completion(.success(profile))
        } catch {
            completion(.failure(error))
        }
    }
    
    func deleteProfile(completion: @escaping (Result<Void, Error>) -> Void) {
        dataManager.deleteProfile()
        completion(.success(()))
    }
}
