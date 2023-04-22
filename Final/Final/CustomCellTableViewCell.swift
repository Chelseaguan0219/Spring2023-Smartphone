//
//  CustomCellTableViewCell.swift
//  Final
//
//  Created by chelsea on 4/22/23.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageContainer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
