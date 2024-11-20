//
//  ApiService.swift
//  UserItemsExam
//
//  Created by Jose Preatorian on 19-11-24.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "ApiService", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
