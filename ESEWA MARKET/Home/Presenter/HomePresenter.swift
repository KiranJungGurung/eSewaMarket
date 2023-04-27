//
//  HomePresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 25/04/2023.
//

import Foundation

//import SwiftyJSON

// task list
protocol HomePresenterViewDelegate: AnyObject {
    func didGetData(with data: [BannerModel]?)
    func didGetDataWithError(message: String?)
}

// boss
class HomePresenter {
    
    weak var delegate: HomePresenterViewDelegate?
    var bannerList = [BannerModel]()
    init(delegate: HomePresenterViewDelegate) {
        self.delegate = delegate
//        fetch()
    }
    
    // api call to fetch list of data
    func fetch() {
        // dummy model
        // model class
       
        let banner1 = BannerModel(name: "Computer",description: "Buy this Computer", price: 700.90)
        let banner2 = BannerModel(name: "Televevisoon",description: "Buy this Computer", price: 500.90)
        let banner3 = BannerModel(name: "refrigratpkefo",description: "Buy this Computer", price: 800.90)
        bannerList.append(banner1)
        bannerList.append(banner2)
        bannerList.append(banner3)
        self.delegate?.didGetData(with: self.bannerList)
        // api call
        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute: {
            
            // switch case check for success or error
            
            // do the necessary according to the result (object map to model)
            // for success (data api bata ayo)
            //self.delegate.didGetData(with: bannerList)
            // the errpr should be in eerror block
            self.delegate?.didGetDataWithError(message: "some error occured while retrieving data")
            
        })
        print("")
    }
}
