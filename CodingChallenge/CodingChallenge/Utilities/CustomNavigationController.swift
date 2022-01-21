//
//  CustomNavigationController.swift
//  CodingChallenge
//
//  Created by WorkAccount on 20/01/22.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set navigationBar title color
        self.navigationController?.navigationBar.barTintColor = .green
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
