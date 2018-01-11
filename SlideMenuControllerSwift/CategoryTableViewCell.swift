//
//  CategoryTableViewCell.swift
//  SlideMenuControllerSwift
//
//  Created by PremMac on 17/11/17.
//  Copyright © 2017 Yuji Hato. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var content_view: UIView!
    @IBOutlet weak var content_image: UIImageView!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        content_view.layer.cornerRadius = 5.0
        content_view.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
