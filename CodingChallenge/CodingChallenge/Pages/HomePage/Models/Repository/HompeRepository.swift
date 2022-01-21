//
//  HompeRepository.swift
//  CodingChallenge
//
//  Created by WorkAccount on 21/01/22.
//

import Foundation


class TestModel: Codable {}

class HomeRepository {
    
    private var networkManager: NetworkService
    
    init(networkManager: NetworkService = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchArticlesFor(section: String = "all-section", period: Int = 7, completion: @escaping (Result<BaseReponseModel, Error>) -> Void) {
        
        // Here we can collect data either from Local Storage or from Networkservice.
        
        // Fetching data from NetworkService
//        guard let url = URL(string: "\(section)/\(period).json?", relativeTo: URL(string: BASE_URL)) else {return}
//        let urlRequest = URLRequest(url: url)
        
//        var components = URLComponents()
//            components.scheme = SCHEME_VALUE
//            components.host = HOST
//            components.path = PATH + "/\(section)/\(period).json"
//            components.queryItems = [
//                URLQueryItem(name: "api-key", value: API_KEY),
//            ]
//
//            // Getting a URL from our components is as simple as
//            // accessing the 'url' property.
//        guard let url = components.url else { return completion(.failure(NetworkError.invalidUrl))}
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"

        
        var request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?&api-key=2XRnYxQeqdA8LnOdy6TBbTx8xYfGzWli")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        networkManager.fetch(request: request, completion: completion)
        
    }
    
    
    
}
