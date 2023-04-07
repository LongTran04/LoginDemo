//
//  LanguageTableViewCell.swift
//  LoginDemo
//
//  Created by Long Tran on 27/03/2023.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var imageLanguage: UIImageView!
    @IBOutlet weak var imageStatusLanguage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
