//
//  RemoteContext.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

private let requestTimeout: TimeInterval = 30

class RemoteContext: NSObject {
    
    var sessionManager:SessionManager!
    
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = requestTimeout
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func cancelAllRequests() {
        sessionManager.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
    }
    
    func httpHeaders() -> [String : String] {
        var headers = [String : String]()
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    func doRequest<T>(request:URLRequestConvertible, completion: @escaping (T?, Error?) -> ()) where T: Mappable {
        sessionManager.request(request).validate().responseObject { (response: DataResponse<T>) in
            switch response.result {
            case .success(let obj):
                completion(obj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func doRequest<T>(request:URLRequestConvertible, completion: @escaping ([T]?, Error?) -> ()) where T: Mappable {
        sessionManager.request(request).validate().responseArray { (response: DataResponse<[T]>) in
            switch response.result {
            case .success(let obj):
                print(obj)
                completion(obj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func doRequest(request:URLRequestConvertible, completion: @escaping (Any?, Error?) -> ()) {
        sessionManager.request(request).validate().responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success(let obj):
                completion(obj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func doRequest(request:URLRequestConvertible, completion: @escaping (String?, Error?) -> ()) {
        sessionManager.request(request).validate().responseString { (response: DataResponse<String>) in
            switch response.result {
            case .success(let obj):
                completion(obj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
