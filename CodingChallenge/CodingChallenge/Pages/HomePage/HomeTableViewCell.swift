//
//  HomeTableViewCell.swift
//  CodingChallenge
//
//  Created by WorkAccount on 20/01/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var thumnailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCellWith(data: Results){
        titleLabel.text = data.title ?? "No title"
        nameLabel1.text = data.byline ?? ""
        dateLabel.text = data.published_date ?? "0000-00-00"
        
        if let imageURL = URL(string:data.media?.first?.mediaMetadata?.first?.url ?? "") {
            thumnailImage.loadImageFrom(imageURL)
        }
    }
    
}
