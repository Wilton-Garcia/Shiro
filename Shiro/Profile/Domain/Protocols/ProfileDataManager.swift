//
//  ProfileDataManager.swift
//  Shiro
//
//  Created by Wilton Garcia on 17/02/25.
//

import Foundation

protocol ProfileUseCaseProtocol {
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void)
    func updateProfile(_ profile: Profile, completion: @escaping (Result<Profile, Error>) -> Void)
    func deleteProfile(completion: @escaping (Result<Void, Error>) -> Void)
}
