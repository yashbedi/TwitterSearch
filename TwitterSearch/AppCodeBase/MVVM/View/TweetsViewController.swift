//
//  TweetsViewController.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit
import SDWebImage

class TweetsViewController: UIViewController {

    // MARK : IBOutlets
    @IBOutlet weak var tweetsTableView: UITableView!
    
    // MARK : Internal Class Properties
    
    internal var tweetsArray : [Tweet]?
    internal var count : Int = 10
    internal var type : String = "recent"
    internal var searchStr : String = ""
    internal var searchController = UISearchController(searchResultsController: nil)
    internal var dataSource : TweetsDataSource?
    
    
    // MARK : View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        tableSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = TweetsDataSource()
        searchSetup()
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9333333333, alpha: 1)
        dataSource?.getToken { _ in }
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    
    // MARK : UI Setup
    
    private func tableSetup(){
        tweetsTableView.tableFooterView = UIView()
        tweetsTableView.keyboardDismissMode = .onDrag
        tweetsTableView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        tweetsTableView.setEmptyMessage(Constants.dummyLabel)
        tweetsTableView.register(UINib(nibName: Constants.tweetWithOutImage, bundle: nil), forCellReuseIdentifier: Constants.tweetWithOutImage)
        tweetsTableView.register(UINib(nibName: Constants.tweetWithImageCell, bundle: nil), forCellReuseIdentifier: Constants.tweetWithImageCell)
    }
    
    private func searchSetup(){
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Twitter"
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.tintColor = .white
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

