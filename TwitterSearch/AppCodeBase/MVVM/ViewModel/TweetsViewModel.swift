//
//  TweetsViewModel.swift
//  TwitterSearch
//
//  Created by Yash Bedi on 12/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation

// TODO: Move below protocol's to a separate file.
protocol TweetsViewModelDelegate: class {
    func willLoadData()
    func didLoadData()
}

protocol TweetsViewModelType {
    func bootstrap()
    var delegate: TweetsViewModelDelegate? { get set }
}



class TweetsViewModel : TweetsViewModelType {
    
    weak var delegate: TweetsViewModelDelegate?
    var tweets: [Tweet] = []
    var dataSource : TweetsDataSource
    
    init(dataSource: TweetsDataSource) {
        self.dataSource = dataSource
    }
    
    func bootstrap() {
        //loadData()
    }
    
    
}
