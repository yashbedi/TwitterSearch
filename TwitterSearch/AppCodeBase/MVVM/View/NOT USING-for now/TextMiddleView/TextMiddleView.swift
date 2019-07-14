//
//  TextMiddleView.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class TextMiddleView: UIView {

    @IBOutlet weak var textLabel: UILabel!
    var height : CGFloat = 1.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1, height: height)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel.text = "Because \"Dr.\" Gorka is trending I'd like to remind everyone he wore a Vitezi Rend medal to Trump's inaugural ball.… https://t.co/m9LgPiyyXK"
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
