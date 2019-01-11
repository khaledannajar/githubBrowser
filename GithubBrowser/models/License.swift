//
//	License.swift
//
//	Create by khaledannajar on 11/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class License : NSObject, NSCoding, Mappable {
    
    var key : String?
    var name : String?
    var nodeId : String?
    var spdxId : String?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable? {
        return License()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        key <- map["key"]
        name <- map["name"]
        nodeId <- map["node_id"]
        spdxId <- map["spdx_id"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        key = aDecoder.decodeObject(forKey: "key") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        spdxId = aDecoder.decodeObject(forKey: "spdx_id") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if key != nil{
            aCoder.encode(key, forKey: "key")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if spdxId != nil{
            aCoder.encode(spdxId, forKey: "spdx_id")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}
