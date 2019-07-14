//
//  TweetWithOutImage.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class TweetWithOutImage: UITableViewCell {

    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var verifiedImage: UIImageView!
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
    
    var mediaUrlAvail = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        verifiedImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        replyIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        heartIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        shareIcon.tintColor = #colorLiteral(red: 0.3977642059, green: 0.4658440351, blue: 0.5242295265, alpha: 1)
        profileImage.layer.cornerRadius = profileImage.frame.height * 0.5
        profileImage.layer.masksToBounds = true
    }
    
    // MARK : USING UISTACKVIEW - Re-usable components
    
//    internal func addSubviews(with image: Bool ){
//        stackView.arrangedSubviews.forEach { (childView) in
//            childView.removeFromSuperview()
//        }
//        stackView.addArrangedSubview(getNameHeaderView())
//        stackView.addArrangedSubview(getTextMiddleView())
//        stackView.addArrangedSubview(getImageMiddleView())
//        stackView.addArrangedSubview(getIconsFooterView())
//    }
    
//    private func getNameHeaderView() -> NameHeaderView {
//        let view = UINib(nibName: "NameHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NameHeaderView
//        view.height = 1
//        return view
//    }
//
//
//    private func getTextMiddleView() -> TextMiddleView {
//        let view = UINib(nibName: "TextMiddleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TextMiddleView
//        view.height = 1.5
//        return view
//    }
//
//    private func getImageMiddleView() -> ImageMiddleView {
//        let view = UINib(nibName: "ImageMiddleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ImageMiddleView
//        view.height = 2
//        return view
//    }
//
//    private func getIconsFooterView() -> IconsFooterView {
//        let view = UINib(nibName: "IconsFooterView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! IconsFooterView
//        view.height = 1
//        return view
//    }
    
}
