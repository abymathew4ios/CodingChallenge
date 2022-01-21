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
        self.navigationController?.navigationBar.barTintColor = MAIN_COLOUR
        setupNavigationBar()
        homeVM.fetchData()
        setupBindings()
    }
    
    //MARK: Bar Button setup
    private func setupNavigationBar(){
        
        // menu button
        let menuButton: UIButton = UIButton(type: .custom)
        menuButton.setImage(UIImage(systemName: "text.justify"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        menuButton.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        menuButton.tintColor = .white
        let menuBarButton = UIBarButtonItem(customView: menuButton)
        
        
        // search button
        let searchButton: UIButton = UIButton(type: .custom)
        searchButton.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        searchButton.contentMode = .center
        searchButton.imageView?.contentMode = .scaleAspectFit
        searchButton.tintColor = .white
        let searchBarButton = UIBarButtonItem(customView: searchButton)
        
        
        // more button
        let moreButton: UIButton = UIButton(type: .custom)
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        moreButton.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        moreButton.contentMode = .scaleAspectFit
        moreButton.tintColor = .white
        let moreBarButton = UIBarButtonItem(customView: moreButton)
                
        navigationItem.rightBarButtonItems = [moreBarButton, searchBarButton]
        navigationItem.leftBarButtonItem = menuBarButton
        
    }
    
    
    //MARK: Bar Button Actions
    @objc func menuTapped(sender : UIButton){
        print("menu button tapped")
    }
    
    @objc func searchTapped(sender : UIButton){
        print("search button tapped")
    }
    
    @objc func moreTapped(sender : UIButton){
        print("more button tapped")
    }
    
    //MARK: Binding Setup
    private func setupBindings() {
        homeVM.messageText = {[weak self] messageValue in
            DispatchQueue.main.async {
                print(messageValue ?? "")
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
            return DetailPageViewController(coder: coder, detailVM: detailVM) // detailVM passing as a dependency object.
        }) else {
            fatalError("Failed to load EditUserViewController from storyboard.")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
