//
//  NameHeaderView.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class NameHeaderView: UIView {

    @IBOutlet weak var dropDownIcon: UIImageView!
    @IBOutlet weak var timeFromNowLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var height : CGFloat = 1.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1, height: height)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeFromNowLabel.text = "・5w"
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
