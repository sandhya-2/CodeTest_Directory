//
//  NetwortManager.swift
//  DirectoryApp
//
//  Created by admin on 03/05/2022.
//

import Foundation

protocol NetworkCaller {
    func getModel<T: Decodable>(urlStr: String, completion: @escaping (Result<T, Error>) -> Void)
}


class NetworkManager {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
}

extension NetworkManager: NetworkCaller {
    
    func getModel<T>(urlStr: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }

            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                print(model)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
}
