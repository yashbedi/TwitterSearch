//
//  TweetWithImageCell.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 13/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class TweetWithImageCell: UITableViewCell {

    @IBOutlet weak var verifiedImage: UIImageView!
    @IBOutlet weak var imageInTweet: UIImageView!
    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shareIcon: UIImageView!
    @IBOutlet weak var favouriteCount: UILabel!
    @IBOutlet weak var heartIcon: UIImageView!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var retweetIcon: UIImageView!
    @IBOutlet weak var replyCount: UILabel!
    @IBOutlet weak var replyIcon: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        verifiedImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        replyIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        heartIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        shareIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        profileImage.layer.cornerRadius = profileImage.frame.height * 0.5
        profileImage.layer.masksToBounds = true
        imageInTweet.layer.cornerRadius = 10
        imageInTweet.layer.masksToBounds = true
    }
}
