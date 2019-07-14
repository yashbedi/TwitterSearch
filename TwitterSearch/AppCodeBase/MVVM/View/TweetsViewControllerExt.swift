//
//  TweetsViewControllerExt.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 15/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

// MARK : TableView Delegate & DataSource Methods


extension TweetsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tweetObject = tweetsArray?[indexPath.row]
        
        if tweetObject?.tweetMediaUrl == "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tweetWithOutImage, for: indexPath) as! TweetWithOutImage
            
            cell.profileImage.sd_setImage(with: URL(string: tweetObject?.profileImageUrl ?? ""), placeholderImage: UIImage())
            cell.verifiedImage.isHidden = !(tweetObject!.verifiedUser)
            cell.createdAtLabel.text = "・\(tweetObject?.tweetCreatedAt ?? "")"
            cell.nameLabel.text = tweetObject?.name ?? ""
            cell.screenName.text = tweetObject?.screenName ?? ""
            cell.retweetCount.text = tweetObject?.reTweetCount == 0 ? "" : "\(tweetObject?.reTweetCount ?? 0)"
            cell.favouriteCount.text = tweetObject?.favouriteCount == 0 ? "" : "\(tweetObject?.favouriteCount ?? 0)"
            cell.tweetTextLabel.text = tweetObject?.text ?? ""
            
            return cell
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tweetWithImageCell, for: indexPath) as! TweetWithImageCell
            
            cell.profileImage.sd_setImage(with: URL(string: tweetObject?.profileImageUrl ?? ""), placeholderImage: UIImage())
            cell.verifiedImage.isHidden = !(tweetObject!.verifiedUser)
            cell.createdAtLabel.text = "・\(tweetObject?.tweetCreatedAt ?? "")"
            cell.nameLabel.text = tweetObject?.name ?? ""
            cell.screenName.text = "@" + (tweetObject?.screenName ?? "")
            cell.retweetCount.text = tweetObject?.reTweetCount == 0 ? "" : "\(tweetObject?.reTweetCount ?? 0)"
            cell.favouriteCount.text = tweetObject?.favouriteCount == 0 ? "" : "\(tweetObject?.favouriteCount ?? 0)"
            cell.tweetTextLabel.text = tweetObject?.text ?? ""
            
            cell.imageInTweet.sd_setImage(with: URL(string: tweetObject?.tweetMediaUrl ?? ""), placeholderImage: UIImage())
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Constants.profileVC) as! ProfileViewController
        vc.userFromTweet = self.tweetsArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK : Scroll view method for Pagination
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let endScrolling: CGFloat = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if (endScrolling >= scrollView.contentSize.height) {
            count += 10
            self.dataSource?.getTweets(from: self.searchStr, count: self.count, type: self.type) { (tweets) in
                self.addMore(tweets: tweets ?? [Tweet]())
            }
        }
    }
    
    // MARK : Pagination Utility
    
    fileprivate func addMore(tweets: [Tweet]){
        for tweet in tweets {
            self.tweetsArray?.append(tweet)
        }
        DispatchQueue.main.async {
            self.tweetsTableView.reloadData()
        }
    }
}

// MARK : Search Controller Delegate Methods

extension TweetsViewController : UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text.count > 0 else { return }
        self.searchStr = text
        dataSource?.getTweets(from: self.searchStr, count: self.count, type: self.type) { (tweets) in
            self.tweetsTableView.setEmptyMessage("")
            self.tweetsArray = tweets
            self.tweetsTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.tweetsArray?.removeAll()
            self.tweetsTableView.reloadData()
            tweetsTableView.setEmptyMessage(Constants.dummyLabel)
        }
    }
}
