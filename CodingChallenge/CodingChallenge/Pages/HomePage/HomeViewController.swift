//
//  ViewController.swift
//  CodingChallenge
//
//  Created by WorkAccount on 20/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var homeVM: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = .systemTeal
        // Do any additional setup after loading the view.
        
        homeVM.fetchData()
        setupBindings()
    }
    
    private func setupBindings() {
        homeVM.messageText = {[weak self] messageValue in
            DispatchQueue.main.async {
                print(messageValue)
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! HomeTableViewCell
        if let article = homeVM.articles?[indexPath.row] {
            cell.configureCellWith(data: article)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedArticle = homeVM.articles?[indexPath.row] else {return}
        showDetailWith(article: selectedArticle)
       
    }
    
    func showDetailWith(article: Results) {
        
        let detailVM = DetailViewModel(result: article)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DetailPageViewController", creator: { coder in
            return DetailPageViewController(coder: coder, detailVM: detailVM)
        }) else {
            fatalError("Failed to load EditUserViewController from storyboard.")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}
