//
//  IconsFooterView.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class IconsFooterView: UIView {
    @IBOutlet weak var replyCount: UILabel!
    
    @IBOutlet weak var shareIcon: UIImageView!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var heartIcon: UIImageView!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var retweetIcon: UIImageView!
    @IBOutlet weak var replyIcon: UIImageView!
    var height : CGFloat = 1.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 1, height: height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
