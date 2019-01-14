//
//	UserProfile.swift
//
//	Create by khaledannajar on 11/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


struct CodingKeys {
    let avatarUrl = "avatar_url"
    let eventsUrl = "events_url"
    let followersUrl = "followers_url"
    let followingUrl = "following_url"
    let gistsUrl = "gists_url"
    let gravatarId = "gravatar_id"
    let htmlUrl = "html_url"
    let id = "id"
    let login = "login"
    let nodeId = "node_id"
    let organizationsUrl = "organizations_url"
    let receivedEventsUrl = "received_events_url"
    let reposUrl = "repos_url"
    let siteAdmin = "site_admin"
    let starredUrl = "starred_url"
    let subscriptionsUrl = "subscriptions_url"
    let type = "type"
    let url = "url"
}

public class OwnerProfile : NSObject, NSCoding, Mappable {
    
    var avatarUrl : String?
    var bio : String?
    var blog : String?
    var company : String?
    var createdAt : String?
    var email : String?
    var eventsUrl : String?
    var followers : Int?
    var followersUrl : String?
    var following : Int?
    var followingUrl : String?
    var gistsUrl : String?
    var gravatarId : String?
    var hireable : Bool?
    var htmlUrl : String?
    var id : Int?
    var location : String?
    var login : String?
    var name : String?
    var nodeId : String?
    var organizationsUrl : String?
    var publicGists : Int?
    var publicRepos : Int?
    var receivedEventsUrl : String?
    var reposUrl : String?
    var siteAdmin : Bool?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var type : String?
    var updatedAt : String?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable? {
        return OwnerProfile()
    }
    required public init?(map: Map){}
    public override init(){}
    
    public func mapping(map: Map)
    {
        avatarUrl <- map["avatar_url"]
        bio <- map["bio"]
        blog <- map["blog"]
        company <- map["company"]
        createdAt <- map["created_at"]
        email <- map["email"]
        eventsUrl <- map["events_url"]
        followers <- map["followers"]
        followersUrl <- map["followers_url"]
        following <- map["following"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        gravatarId <- map["gravatar_id"]
        hireable <- map["hireable"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        location <- map["location"]
        login <- map["login"]
        name <- map["name"]
        nodeId <- map["node_id"]
        organizationsUrl <- map["organizations_url"]
        publicGists <- map["public_gists"]
        publicRepos <- map["public_repos"]
        receivedEventsUrl <- map["received_events_url"]
        reposUrl <- map["repos_url"]
        siteAdmin <- map["site_admin"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        type <- map["type"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        avatarUrl = aDecoder.decodeObject(forKey: "avatar_url") as? String
        bio = aDecoder.decodeObject(forKey: "bio") as? String
        blog = aDecoder.decodeObject(forKey: "blog") as? String
        company = aDecoder.decodeObject(forKey: "company") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
        followers = aDecoder.decodeObject(forKey: "followers") as? Int
        followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
        following = aDecoder.decodeObject(forKey: "following") as? Int
        followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
        gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
        gravatarId = aDecoder.decodeObject(forKey: "gravatar_id") as? String
        hireable = aDecoder.decodeObject(forKey: "hireable") as? Bool
        htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        location = aDecoder.decodeObject(forKey: "location") as? String
        login = aDecoder.decodeObject(forKey: "login") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        organizationsUrl = aDecoder.decodeObject(forKey: "organizations_url") as? String
        publicGists = aDecoder.decodeObject(forKey: "public_gists") as? Int
        publicRepos = aDecoder.decodeObject(forKey: "public_repos") as? Int
        receivedEventsUrl = aDecoder.decodeObject(forKey: "received_events_url") as? String
        reposUrl = aDecoder.decodeObject(forKey: "repos_url") as? String
        siteAdmin = aDecoder.decodeObject(forKey: "site_admin") as? Bool
        starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
        subscriptionsUrl = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc public func encode(with aCoder: NSCoder)
    {
        if avatarUrl != nil{
            aCoder.encode(avatarUrl, forKey: "avatar_url")
        }
        if bio != nil{
            aCoder.encode(bio, forKey: "bio")
        }
        if blog != nil{
            aCoder.encode(blog, forKey: "blog")
        }
        if company != nil{
            aCoder.encode(company, forKey: "company")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if eventsUrl != nil{
            aCoder.encode(eventsUrl, forKey: "events_url")
        }
        if followers != nil{
            aCoder.encode(followers, forKey: "followers")
        }
        if followersUrl != nil{
            aCoder.encode(followersUrl, forKey: "followers_url")
        }
        if following != nil{
            aCoder.encode(following, forKey: "following")
        }
        if followingUrl != nil{
            aCoder.encode(followingUrl, forKey: "following_url")
        }
        if gistsUrl != nil{
            aCoder.encode(gistsUrl, forKey: "gists_url")
        }
        if gravatarId != nil{
            aCoder.encode(gravatarId, forKey: "gravatar_id")
        }
        if hireable != nil{
            aCoder.encode(hireable, forKey: "hireable")
        }
        if htmlUrl != nil{
            aCoder.encode(htmlUrl, forKey: "html_url")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if location != nil{
            aCoder.encode(location, forKey: "location")
        }
        if login != nil{
            aCoder.encode(login, forKey: "login")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if organizationsUrl != nil{
            aCoder.encode(organizationsUrl, forKey: "organizations_url")
        }
        if publicGists != nil{
            aCoder.encode(publicGists, forKey: "public_gists")
        }
        if publicRepos != nil{
            aCoder.encode(publicRepos, forKey: "public_repos")
        }
        if receivedEventsUrl != nil{
            aCoder.encode(receivedEventsUrl, forKey: "received_events_url")
        }
        if reposUrl != nil{
            aCoder.encode(reposUrl, forKey: "repos_url")
        }
        if siteAdmin != nil{
            aCoder.encode(siteAdmin, forKey: "site_admin")
        }
        if starredUrl != nil{
            aCoder.encode(starredUrl, forKey: "starred_url")
        }
        if subscriptionsUrl != nil{
            aCoder.encode(subscriptionsUrl, forKey: "subscriptions_url")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
    }
}
