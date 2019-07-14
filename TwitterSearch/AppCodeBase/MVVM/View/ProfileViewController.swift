//
//  ProfileViewController.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 15/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {

    // MARK : IBOutlets
    
    @IBOutlet weak var firstChildViewOfScroll: UIView!
    @IBOutlet weak var profileScrollView: UIScrollView!
    //@IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var verifiedImage: UIImageView!
    @IBOutlet weak var follow: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var joined: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    // MARK : Internal properties
    
    internal var userFromTweet : Tweet?
    
    // MARK : View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circularBorderToImages()
    }
    
    
    // MARK: Utility Methods
    
    private func setData(){
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        verifiedImage.isHidden = true
        name.text = userFromTweet?.name
        screenName.text = userFromTweet?.screenName
        verifiedImage.isHidden = !(userFromTweet!.verifiedUser)
        bio.text = userFromTweet?.bio
        location.text = userFromTweet?.location
        joined.text = userFromTweet?.userCreatedAt == "" ? "" : "Joined " + (userFromTweet?.userCreatedAt ?? "")
        followingCount.text = "\(userFromTweet!.following)"
        followersCount.text = "\(userFromTweet!.followers)"
        coverImage.tintColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9333333333, alpha: 1)
        
        profileImage.sd_setImage(with: URL(string: userFromTweet?.profileImageUrl ?? ""), placeholderImage: UIImage())
        coverImage.sd_setImage(with: URL(string: userFromTweet?.coverImageUrl ?? ""), placeholderImage: UIImage(named:"backGround"))
        
    }
    private func circularBorderToImages(){
        follow.layer.cornerRadius = follow.frame.height / 2
        follow.layer.borderWidth = 1
        follow.layer.borderColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9333333333, alpha: 1)
        follow.setTitleColor(#colorLiteral(red: 0, green: 0.6745098039, blue: 0.9333333333, alpha: 1), for: .normal)
        follow.layer.masksToBounds = true
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 4
        profileImage.layer.borderColor = UIColor.white.cgColor
    }
}
