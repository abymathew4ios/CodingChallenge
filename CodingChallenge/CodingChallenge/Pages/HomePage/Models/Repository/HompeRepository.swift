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
    
    init(networkManager: NetworkService = NetworkManager()) { // dependency injecion via construction will make more testability of HomeRpository
        self.networkManager = networkManager
    }
    
    func fetchArticlesFor(section: String = "all-section", period: Int = 7, completion: @escaping (Result<BaseReponseModel, Error>) -> Void) {
        
        // Here we can collect data either from Local Storage or from Networkservice.
        
        // Fetching data from NetworkService
        var request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?&api-key=2XRnYxQeqdA8LnOdy6TBbTx8xYfGzWli")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        networkManager.fetch(request: request, completion: completion)
        
    }
    
    
    
}
