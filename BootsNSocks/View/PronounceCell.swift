//
//  PronounceCell.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit

class PronounceCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: PaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLabel.layer.cornerRadius = 4
        textLabel.layer.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.9).cgColor
    }

}
