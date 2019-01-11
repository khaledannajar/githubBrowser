//
//	SearchResults.swift
//
//	Create by khaledannajar on 11/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SearchResults : NSObject, NSCoding, Mappable {
    
    var incompleteResults : Bool?
    var repos : [CodeRepository]?
    var totalCount : Int?
    
    
    class func newInstance(map: Map) -> Mappable? {
        return SearchResults()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        incompleteResults <- map["incomplete_results"]
        repos <- map["items"]
        totalCount <- map["total_count"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        incompleteResults = aDecoder.decodeObject(forKey: "incomplete_results") as? Bool
        repos = aDecoder.decodeObject(forKey: "items") as? [CodeRepository]
        totalCount = aDecoder.decodeObject(forKey: "total_count") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if incompleteResults != nil{
            aCoder.encode(incompleteResults, forKey: "incomplete_results")
        }
        if repos != nil{
            aCoder.encode(repos, forKey: "items")
        }
        if totalCount != nil{
            aCoder.encode(totalCount, forKey: "total_count")
        }
        
    }
    
}
