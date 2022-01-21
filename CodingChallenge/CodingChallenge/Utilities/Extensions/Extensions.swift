//
//  Extensions.swift
//  CodingChallenge
//
//  Created by WorkAccount on 21/01/22.
//

import Foundation
import UIKit

//MARK: ImageView Extension
extension UIImageView {
    
    func loadImageFrom(_ url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
