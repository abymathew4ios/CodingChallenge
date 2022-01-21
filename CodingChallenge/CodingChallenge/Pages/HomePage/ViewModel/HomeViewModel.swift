//
//  HomeViewModel.swift
//  CodingChallenge
//
//  Created by WorkAccount on 21/01/22.
//

import Foundation

class HomeViewModel {
    
    private var repository: HomeRepository
    
    var articles: [Results]? = [] {
        didSet {
            messageText?("update UI")
        }
    }
    var messageText: ((String?) -> Void)?
    
    
    
    init(repository: HomeRepository = HomeRepository()) {
        self.repository = repository
    }
    
    func fetchData() {
        repository.fetchArticlesFor(section: "all-section", period: 7) { [weak self] result in
            switch result {
            case .success(let values):
                self?.articles = values.results
            case .failure(let error):
                self?.messageText?("failed to load data \(error.localizedDescription)")
                
            }
        }
    }
    
    
}
