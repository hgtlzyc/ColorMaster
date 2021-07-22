//
//  ColorCollectionViewCell.swift
//  ColorMaster
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var cellLabel: UILabel!

    func updateViews(color: UIColor, label: String) {
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 20
        cellLabel.text = label
    }

}


