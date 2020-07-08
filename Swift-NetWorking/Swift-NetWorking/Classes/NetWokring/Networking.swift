//
//  Networking.swift
//  Swift-Networking
//
//  Created by qjinliang on 2020/7/7.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum Method {
    case GET
    case POST
}

class Networking: NSObject {
    
    class func requestData(type : Method, URlString: String, parameters : [String : Any]? = nil,  finishCallBack : @escaping (_ responseCall : Data)->()){
        
        let type = type == Method.GET ? HTTPMethod.get : HTTPMethod.post
        
        // 配置 HTTPHeaders
        let headers: HTTPHeaders = [
            "charset":"utf-8",
            "Cookie" : "acf_did=6412f66c83a322e90fa3307d00001521",
            "User-Device": "NjQxMmY2NmM4M2EzMjJlOTBmYTMzMDdkMDAwMDE1MjF8NS4wMDA=",
            "time" : getTimeStamp(),
            "auth" : "f390ebfa09d1dbe6765e91f82ee62b34",
            "aid"  : "ios",
            "User-Agent" : "ios/5.000 (ios 12.1; ; iPhone 6 (A1549/A1586))",
            "Accept-Encoding" : "br, gzip, deflate",
            "Content-Type" : "application/x-www-form-urlencoded",
        ]
        
        Alamofire.request(URlString, method: type, parameters: parameters, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { (response) in
            
            
            print("\n====================== NetWorking ===============================")
            print("Method:\(type)请求\nURL: \(URlString)\n请求参数parameters:")
            if parameters != nil{
                print(response.request?.url ?? "url")
                print(parameters ?? String())
            }
            
            // 判断是否错误
            guard let result = response.result.value else {
                print(response.result.error ?? "请求错误❌")
                return
            }
            print("返回报文response:")
            // 打印请求返回的报文
            //           print(result)
            debugPrint(result)
            guard let dict = result as? [String : Any] else {
                return
            }
            
            // 返回字典类型 Data
            if let dataDict = dict["data"] as? [String : Any] {
                
                let jsonData = try? JSONSerialization.data(withJSONObject: dataDict, options: .prettyPrinted)
                if jsonData != nil {
                    finishCallBack(jsonData!)
                    return
                }
            }
            
            // 返回数组类型Data
            if ((dict["data"] as? [Any]) != nil) {
                let arrData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                if arrData != nil {
                    finishCallBack(arrData!)
                }
            }
            
            // 直接返回报文数据
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            if jsonData != nil {
                finishCallBack(jsonData!)
                return
            }
        }
    }
}
