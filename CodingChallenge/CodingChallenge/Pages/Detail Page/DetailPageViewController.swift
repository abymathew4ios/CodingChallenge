//
//  DetailPageViewController.swift
//  CodingChallenge
//
//  Created by WorkAccount on 21/01/22.
//

import UIKit

class DetailPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var detailVM: DetailViewModel
    
    init?(coder: NSCoder, detailVM: DetailViewModel) {
           self.detailVM = detailVM
           super.init(coder: coder)
       }

       required init?(coder: NSCoder) {
           fatalError("You must create this view controller with a user.")
       }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = detailVM.result.title ?? ""
        byLineLabel.text = detailVM.result.byline ?? ""
        dateLabel.text = detailVM.result.published_date ?? ""
        
        if let imageURL = URL(string:detailVM.result.media?.first?.mediaMetadata?[1].url ?? "") {
            imageView.loadImageFrom(imageURL)
        }
    }
    


}
