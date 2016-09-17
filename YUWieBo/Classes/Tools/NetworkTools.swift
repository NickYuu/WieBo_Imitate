//
//  NetworkTools.swift
//  01-AFNetworking的封裝
//
//  Created by 游宗翰 on 2016/9/10.
//  Copyright © 2016年 han. All rights reserved.
//

import AFNetworking

// 定義枚舉類型
enum RequestType:String {
    case get = "GET"
    case post = "POST"
}

class NetworkTools: AFHTTPSessionManager {

    static let shareInstance = { () -> NetworkTools in 
       let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/htnl")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
}

// MARK:- 封裝請求方法
extension NetworkTools {
    func request(methodType:RequestType, URLString:String, parameters:[String:AnyObject]?, finished:@escaping (_ result:Any?, _ err:Error?)->()) {
        
        let successCallBack = { (task:URLSessionDataTask, result:Any?) in
            finished(result, nil)
        }
        
        let failureCallBack = { (task:URLSessionDataTask?, err:Error) in
            finished(nil, err)
        }

        
        if methodType == .get {
            get(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }else {
            post(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
    }
    
}

// MARK:- 請求AccessToken
extension NetworkTools {
    func loadAccessToken(code : String, finished : @escaping (_ result : [String : AnyObject]?, _ error : NSError?) -> ()) {
        // 獲取請求的URLString
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 獲取請求的參數
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "redirect_uri" : redirect_uri, "code" : code]
        
        // 發送網路請求
        request(methodType: .post, URLString: urlString, parameters: parameters as [String : AnyObject]?) { (result, error) -> () in
            finished(result as? [String : AnyObject], error as NSError?)
        }
    }
}

// MARK:- 請求用戶資訊
extension NetworkTools {
    func loadUserInfo(access_token : String, uid : String, finished : @escaping (_ result : [String : AnyObject]?, _ error : NSError?) -> ()) {
        // 獲取請求的URLString
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        // 獲取請求的參數
        let parameters = ["access_token" : access_token, "uid" : uid]
        
        // 發送網路請求
        request(methodType: .get, URLString: urlString, parameters: parameters as [String : AnyObject]?) { (result, error) -> () in
            finished(result as? [String : AnyObject] , error as NSError?)
        }
    }
}

// MARK:- 請求首頁數據
extension NetworkTools {
    func loadStatuses(finished: @escaping (_ result:[[String:AnyObject]]?, _ err:Error?) -> ()) {
        
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        let parameters = ["access_token":(UserAccountViewModel.shareIntance.account?.access_token)!]
                
        request(methodType: .get, URLString: urlString, parameters: parameters as [String : AnyObject]?) { (result, err) in
            
            guard let resultDic = result as? [String : AnyObject] else {
                finished(nil, err)
                return
            }
            
            finished(resultDic["statuses"] as? [[String : AnyObject]],err)
        }
    }
}


