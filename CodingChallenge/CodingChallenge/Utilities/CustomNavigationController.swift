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
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
