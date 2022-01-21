//
//  NetworkManager.swift
//  CodingChallenge
//
//  Created by WorkAccount on 21/01/22.
//

import Foundation

//--------------------------- Abstract layer for Network ---------------------------
protocol NetworkService {
    func fetch<T: Codable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

//---------------------------




// Network Error
enum NetworkError: Error {
    case invalidUrl
    case invalidData
}

// NetworkManager
class NetworkManager: NetworkService { // NetworkManager confirming NetworkService interface (this way we achieved Dependency Inversion)
    
    // fetch method with effective use of GENERICS and RESULT type.
    func fetch<T: Codable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        // url session call API
        let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    completion(.failure(NetworkError.invalidData))
                    return
                }
                if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(decodedResponse))
                    }
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            }
            dataTask.resume()
        
    }
}
