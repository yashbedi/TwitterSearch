//
//  ImageMiddleView.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class ImageMiddleView: UIView {
    
    @IBOutlet weak var tweetsImageView: UIImageView!
    var height : CGFloat = 1.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1, height: height)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tweetsImageView.layer.cornerRadius = 7
        tweetsImageView.layer.masksToBounds = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
