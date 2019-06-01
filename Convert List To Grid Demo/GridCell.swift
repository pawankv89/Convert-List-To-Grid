//
//  GridCell.swift
//  Convert List To Grid Demo
//
//  Created by Pawan kumar on 16/05/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {

   static var reuseIdentifier_GridCell: String = "GridCell"
   static var reuseIdentifier_ListCell: String = "ListCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
