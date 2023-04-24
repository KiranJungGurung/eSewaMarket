//
//  ViewControllerPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.
//

//import Foundation
//import Alamofire
//import ObjectMapper
//
//struct ProductResponse: Mappable {
//    var productId: Int?
//    var productTitle: String?
//    var price, category, description, image: String?
//    
//    init?(map: ObjectMapper.Map) {
//    }
//    
//    mutating func mapping(map: ObjectMapper.Map) {
//        productId <- map["id"]
//        productTitle <- map["title"]
//        price <- map["price"]
//        category <- map["category"]
//        description <- map["description"]
//        image <- map["image"]
//    }
//}
//
//protocol ViewControllerDelegate {
//    func getProductList(resposne: ProductResponse)
//}
//
//class ViewControllerPresenter {
//
//    var delegate: ViewControllerDelegate?
//    let service = ViewSevice()
//    
//    init(delegate: ViewControllerDelegate? = nil) {
//        self.delegate = delegate
//    }
//    
//    func getProducts() {
//        AF.request(getProductURL).response { response in
//            switch response.result {
//            case .success(let data):
//                guard let castingValue = data as? [String: Any] else { return }
//                guard let userData = Mapper<ProductResponse>().map(JSON: castingValue) else { return }
//                
//                
//                break
//            case .failure(let error):
//                print(error.localizedDescription)
//                break
//            }
//        }
//        
//        loginUser(userName: "ok", password: "123") { response in
//            if response {
//                
//            }
//        }
//        
//        
//    }
//
//    
//    func loginUser(userName: String, password: String, yetekai: @escaping (Bool) -> ()) {
//        let _ : [String: Any] = [
//            "userName": userName,
//            "password": password]
//        
//        AF.request(getProductURL).response { response in
//            switch response.result {
//            case .success(let data):
//                guard let castingValue = data as? [String: Any] else { return }
//                guard let userData = Mapper<ProductResponse>().map(JSON: castingValue) else { return }
//                yetekai(true)
//                
//                break
//            case .failure(let error):
//                print(error.localizedDescription)
//                yetekai(false)
//                break
//            }
//        }
//    }
//}
