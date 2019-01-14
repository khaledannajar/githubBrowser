//
//	CodeRepository.swift
//
//	Create by khaledannajar on 11/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


public class CodeRepository : NSObject, NSCoding, Mappable {
    
    public var archiveUrl : String?
    public var archived : Bool?
    public var assigneesUrl : String?
    public var blobsUrl : String?
    public var branchesUrl : String?
    public var cloneUrl : String?
    public var collaboratorsUrl : String?
    public var commentsUrl : String?
    public var commitsUrl : String?
    public var compareUrl : String?
    public var contentsUrl : String?
    public var contributorsUrl : String?
    public var createdAt : String?
    public var defaultBranch : String?
    public var deploymentsUrl : String?
    public var descriptionField : String?
    public var downloadsUrl : String?
    public var eventsUrl : String?
    public var fork : Bool?
    public var forks : Int?
    public var forksCount : Int?
    public var forksUrl : String?
    public var fullName : String?
    public var gitCommitsUrl : String?
    public var gitRefsUrl : String?
    public var gitTagsUrl : String?
    public var gitUrl : String?
    public var hasDownloads : Bool?
    public var hasIssues : Bool?
    public var hasPages : Bool?
    public var hasProjects : Bool?
    public var hasWiki : Bool?
    public var homepage : String?
    public var hooksUrl : String?
    public var htmlUrl : String?
    public var id : Int?
    public var issueCommentUrl : String?
    public var issueEventsUrl : String?
    public var issuesUrl : String?
    public var keysUrl : String?
    public var labelsUrl : String?
    public var language : String?
    public var languagesUrl : String?
    public var license : License?
    public var mergesUrl : String?
    public var milestonesUrl : String?
    public var mirrorUrl : Any?
    public var name : String?
    public var nodeId : String?
    public var notificationsUrl : String?
    public var openIssues : Int?
    public var openIssuesCount : Int?
    public var userProfile : OwnerProfile?
    public var privateField : Bool?
    public var pullsUrl : String?
    public var pushedAt : String?
    public var releasesUrl : String?
    
    public var size : Int?
    public var sshUrl : String?
    public var stargazersCount : Int?
    public var stargazersUrl : String?
    public var statusesUrl : String?
    public var subscribersUrl : String?
    public var subscriptionUrl : String?
    public var svnUrl : String?
    public var tagsUrl : String?
    public var teamsUrl : String?
    public var treesUrl : String?
    public var updatedAt : String?
    public var url : String?
    public var watchers : Int?
    public var watchersCount : Int?
    
    
    class func newInstance(map: Map) -> Mappable? {
        return CodeRepository()
    }
    required public init?(map: Map){}
    public override init(){}
    
    public func mapping(map: Map)
    {
        archiveUrl <- map["archive_url"]
        archived <- map["archived"]
        assigneesUrl <- map["assignees_url"]
        blobsUrl <- map["blobs_url"]
        branchesUrl <- map["branches_url"]
        cloneUrl <- map["clone_url"]
        collaboratorsUrl <- map["collaborators_url"]
        commentsUrl <- map["comments_url"]
        commitsUrl <- map["commits_url"]
        compareUrl <- map["compare_url"]
        contentsUrl <- map["contents_url"]
        contributorsUrl <- map["contributors_url"]
        createdAt <- map["created_at"]
        defaultBranch <- map["default_branch"]
        deploymentsUrl <- map["deployments_url"]
        descriptionField <- map["description"]
        downloadsUrl <- map["downloads_url"]
        eventsUrl <- map["events_url"]
        fork <- map["fork"]
        forks <- map["forks"]
        forksCount <- map["forks_count"]
        forksUrl <- map["forks_url"]
        fullName <- map["full_name"]
        gitCommitsUrl <- map["git_commits_url"]
        gitRefsUrl <- map["git_refs_url"]
        gitTagsUrl <- map["git_tags_url"]
        gitUrl <- map["git_url"]
        hasDownloads <- map["has_downloads"]
        hasIssues <- map["has_issues"]
        hasPages <- map["has_pages"]
        hasProjects <- map["has_projects"]
        hasWiki <- map["has_wiki"]
        homepage <- map["homepage"]
        hooksUrl <- map["hooks_url"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        issueCommentUrl <- map["issue_comment_url"]
        issueEventsUrl <- map["issue_events_url"]
        issuesUrl <- map["issues_url"]
        keysUrl <- map["keys_url"]
        labelsUrl <- map["labels_url"]
        language <- map["language"]
        languagesUrl <- map["languages_url"]
        license <- map["license"]
        mergesUrl <- map["merges_url"]
        milestonesUrl <- map["milestones_url"]
        mirrorUrl <- map["mirror_url"]
        name <- map["name"]
        nodeId <- map["node_id"]
        notificationsUrl <- map["notifications_url"]
        openIssues <- map["open_issues"]
        openIssuesCount <- map["open_issues_count"]
        userProfile <- map["owner"]
        privateField <- map["private"]
        pullsUrl <- map["pulls_url"]
        pushedAt <- map["pushed_at"]
        releasesUrl <- map["releases_url"]
        size <- map["size"]
        sshUrl <- map["ssh_url"]
        stargazersCount <- map["stargazers_count"]
        stargazersUrl <- map["stargazers_url"]
        statusesUrl <- map["statuses_url"]
        subscribersUrl <- map["subscribers_url"]
        subscriptionUrl <- map["subscription_url"]
        svnUrl <- map["svn_url"]
        tagsUrl <- map["tags_url"]
        teamsUrl <- map["teams_url"]
        treesUrl <- map["trees_url"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        watchers <- map["watchers"]
        watchersCount <- map["watchers_count"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        archiveUrl = aDecoder.decodeObject(forKey: "archive_url") as? String
        archived = aDecoder.decodeObject(forKey: "archived") as? Bool
        assigneesUrl = aDecoder.decodeObject(forKey: "assignees_url") as? String
        blobsUrl = aDecoder.decodeObject(forKey: "blobs_url") as? String
        branchesUrl = aDecoder.decodeObject(forKey: "branches_url") as? String
        cloneUrl = aDecoder.decodeObject(forKey: "clone_url") as? String
        collaboratorsUrl = aDecoder.decodeObject(forKey: "collaborators_url") as? String
        commentsUrl = aDecoder.decodeObject(forKey: "comments_url") as? String
        commitsUrl = aDecoder.decodeObject(forKey: "commits_url") as? String
        compareUrl = aDecoder.decodeObject(forKey: "compare_url") as? String
        contentsUrl = aDecoder.decodeObject(forKey: "contents_url") as? String
        contributorsUrl = aDecoder.decodeObject(forKey: "contributors_url") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        defaultBranch = aDecoder.decodeObject(forKey: "default_branch") as? String
        deploymentsUrl = aDecoder.decodeObject(forKey: "deployments_url") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        downloadsUrl = aDecoder.decodeObject(forKey: "downloads_url") as? String
        eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
        fork = aDecoder.decodeObject(forKey: "fork") as? Bool
        forks = aDecoder.decodeObject(forKey: "forks") as? Int
        forksCount = aDecoder.decodeObject(forKey: "forks_count") as? Int
        forksUrl = aDecoder.decodeObject(forKey: "forks_url") as? String
        fullName = aDecoder.decodeObject(forKey: "full_name") as? String
        gitCommitsUrl = aDecoder.decodeObject(forKey: "git_commits_url") as? String
        gitRefsUrl = aDecoder.decodeObject(forKey: "git_refs_url") as? String
        gitTagsUrl = aDecoder.decodeObject(forKey: "git_tags_url") as? String
        gitUrl = aDecoder.decodeObject(forKey: "git_url") as? String
        hasDownloads = aDecoder.decodeObject(forKey: "has_downloads") as? Bool
        hasIssues = aDecoder.decodeObject(forKey: "has_issues") as? Bool
        hasPages = aDecoder.decodeObject(forKey: "has_pages") as? Bool
        hasProjects = aDecoder.decodeObject(forKey: "has_projects") as? Bool
        hasWiki = aDecoder.decodeObject(forKey: "has_wiki") as? Bool
        homepage = aDecoder.decodeObject(forKey: "homepage") as? String
        hooksUrl = aDecoder.decodeObject(forKey: "hooks_url") as? String
        htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        issueCommentUrl = aDecoder.decodeObject(forKey: "issue_comment_url") as? String
        issueEventsUrl = aDecoder.decodeObject(forKey: "issue_events_url") as? String
        issuesUrl = aDecoder.decodeObject(forKey: "issues_url") as? String
        keysUrl = aDecoder.decodeObject(forKey: "keys_url") as? String
        labelsUrl = aDecoder.decodeObject(forKey: "labels_url") as? String
        language = aDecoder.decodeObject(forKey: "language") as? String
        languagesUrl = aDecoder.decodeObject(forKey: "languages_url") as? String
        license = aDecoder.decodeObject(forKey: "license") as? License
        mergesUrl = aDecoder.decodeObject(forKey: "merges_url") as? String
        milestonesUrl = aDecoder.decodeObject(forKey: "milestones_url") as? String
        mirrorUrl = aDecoder.decodeObject(forKey: "mirror_url")
        name = aDecoder.decodeObject(forKey: "name") as? String
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        notificationsUrl = aDecoder.decodeObject(forKey: "notifications_url") as? String
        openIssues = aDecoder.decodeObject(forKey: "open_issues") as? Int
        openIssuesCount = aDecoder.decodeObject(forKey: "open_issues_count") as? Int
        userProfile = aDecoder.decodeObject(forKey: "owner") as? OwnerProfile
        privateField = aDecoder.decodeObject(forKey: "private") as? Bool
        pullsUrl = aDecoder.decodeObject(forKey: "pulls_url") as? String
        pushedAt = aDecoder.decodeObject(forKey: "pushed_at") as? String
        releasesUrl = aDecoder.decodeObject(forKey: "releases_url") as? String
        size = aDecoder.decodeObject(forKey: "size") as? Int
        sshUrl = aDecoder.decodeObject(forKey: "ssh_url") as? String
        stargazersCount = aDecoder.decodeObject(forKey: "stargazers_count") as? Int
        stargazersUrl = aDecoder.decodeObject(forKey: "stargazers_url") as? String
        statusesUrl = aDecoder.decodeObject(forKey: "statuses_url") as? String
        subscribersUrl = aDecoder.decodeObject(forKey: "subscribers_url") as? String
        subscriptionUrl = aDecoder.decodeObject(forKey: "subscription_url") as? String
        svnUrl = aDecoder.decodeObject(forKey: "svn_url") as? String
        tagsUrl = aDecoder.decodeObject(forKey: "tags_url") as? String
        teamsUrl = aDecoder.decodeObject(forKey: "teams_url") as? String
        treesUrl = aDecoder.decodeObject(forKey: "trees_url") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        watchers = aDecoder.decodeObject(forKey: "watchers") as? Int
        watchersCount = aDecoder.decodeObject(forKey: "watchers_count") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc public func encode(with aCoder: NSCoder)
    {
        if archiveUrl != nil{
            aCoder.encode(archiveUrl, forKey: "archive_url")
        }
        if archived != nil{
            aCoder.encode(archived, forKey: "archived")
        }
        if assigneesUrl != nil{
            aCoder.encode(assigneesUrl, forKey: "assignees_url")
        }
        if blobsUrl != nil{
            aCoder.encode(blobsUrl, forKey: "blobs_url")
        }
        if branchesUrl != nil{
            aCoder.encode(branchesUrl, forKey: "branches_url")
        }
        if cloneUrl != nil{
            aCoder.encode(cloneUrl, forKey: "clone_url")
        }
        if collaboratorsUrl != nil{
            aCoder.encode(collaboratorsUrl, forKey: "collaborators_url")
        }
        if commentsUrl != nil{
            aCoder.encode(commentsUrl, forKey: "comments_url")
        }
        if commitsUrl != nil{
            aCoder.encode(commitsUrl, forKey: "commits_url")
        }
        if compareUrl != nil{
            aCoder.encode(compareUrl, forKey: "compare_url")
        }
        if contentsUrl != nil{
            aCoder.encode(contentsUrl, forKey: "contents_url")
        }
        if contributorsUrl != nil{
            aCoder.encode(contributorsUrl, forKey: "contributors_url")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if defaultBranch != nil{
            aCoder.encode(defaultBranch, forKey: "default_branch")
        }
        if deploymentsUrl != nil{
            aCoder.encode(deploymentsUrl, forKey: "deployments_url")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if downloadsUrl != nil{
            aCoder.encode(downloadsUrl, forKey: "downloads_url")
        }
        if eventsUrl != nil{
            aCoder.encode(eventsUrl, forKey: "events_url")
        }
        if fork != nil{
            aCoder.encode(fork, forKey: "fork")
        }
        if forks != nil{
            aCoder.encode(forks, forKey: "forks")
        }
        if forksCount != nil{
            aCoder.encode(forksCount, forKey: "forks_count")
        }
        if forksUrl != nil{
            aCoder.encode(forksUrl, forKey: "forks_url")
        }
        if fullName != nil{
            aCoder.encode(fullName, forKey: "full_name")
        }
        if gitCommitsUrl != nil{
            aCoder.encode(gitCommitsUrl, forKey: "git_commits_url")
        }
        if gitRefsUrl != nil{
            aCoder.encode(gitRefsUrl, forKey: "git_refs_url")
        }
        if gitTagsUrl != nil{
            aCoder.encode(gitTagsUrl, forKey: "git_tags_url")
        }
        if gitUrl != nil{
            aCoder.encode(gitUrl, forKey: "git_url")
        }
        if hasDownloads != nil{
            aCoder.encode(hasDownloads, forKey: "has_downloads")
        }
        if hasIssues != nil{
            aCoder.encode(hasIssues, forKey: "has_issues")
        }
        if hasPages != nil{
            aCoder.encode(hasPages, forKey: "has_pages")
        }
        if hasProjects != nil{
            aCoder.encode(hasProjects, forKey: "has_projects")
        }
        if hasWiki != nil{
            aCoder.encode(hasWiki, forKey: "has_wiki")
        }
        if homepage != nil{
            aCoder.encode(homepage, forKey: "homepage")
        }
        if hooksUrl != nil{
            aCoder.encode(hooksUrl, forKey: "hooks_url")
        }
        if htmlUrl != nil{
            aCoder.encode(htmlUrl, forKey: "html_url")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if issueCommentUrl != nil{
            aCoder.encode(issueCommentUrl, forKey: "issue_comment_url")
        }
        if issueEventsUrl != nil{
            aCoder.encode(issueEventsUrl, forKey: "issue_events_url")
        }
        if issuesUrl != nil{
            aCoder.encode(issuesUrl, forKey: "issues_url")
        }
        if keysUrl != nil{
            aCoder.encode(keysUrl, forKey: "keys_url")
        }
        if labelsUrl != nil{
            aCoder.encode(labelsUrl, forKey: "labels_url")
        }
        if language != nil{
            aCoder.encode(language, forKey: "language")
        }
        if languagesUrl != nil{
            aCoder.encode(languagesUrl, forKey: "languages_url")
        }
        if license != nil{
            aCoder.encode(license, forKey: "license")
        }
        if mergesUrl != nil{
            aCoder.encode(mergesUrl, forKey: "merges_url")
        }
        if milestonesUrl != nil{
            aCoder.encode(milestonesUrl, forKey: "milestones_url")
        }
        if mirrorUrl != nil{
            aCoder.encode(mirrorUrl, forKey: "mirror_url")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if notificationsUrl != nil{
            aCoder.encode(notificationsUrl, forKey: "notifications_url")
        }
        if openIssues != nil{
            aCoder.encode(openIssues, forKey: "open_issues")
        }
        if openIssuesCount != nil{
            aCoder.encode(openIssuesCount, forKey: "open_issues_count")
        }
        if userProfile != nil{
            aCoder.encode(userProfile, forKey: "owner")
        }
        if privateField != nil{
            aCoder.encode(privateField, forKey: "private")
        }
        if pullsUrl != nil{
            aCoder.encode(pullsUrl, forKey: "pulls_url")
        }
        if pushedAt != nil{
            aCoder.encode(pushedAt, forKey: "pushed_at")
        }
        if releasesUrl != nil{
            aCoder.encode(releasesUrl, forKey: "releases_url")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if sshUrl != nil{
            aCoder.encode(sshUrl, forKey: "ssh_url")
        }
        if stargazersCount != nil{
            aCoder.encode(stargazersCount, forKey: "stargazers_count")
        }
        if stargazersUrl != nil{
            aCoder.encode(stargazersUrl, forKey: "stargazers_url")
        }
        if statusesUrl != nil{
            aCoder.encode(statusesUrl, forKey: "statuses_url")
        }
        if subscribersUrl != nil{
            aCoder.encode(subscribersUrl, forKey: "subscribers_url")
        }
        if subscriptionUrl != nil{
            aCoder.encode(subscriptionUrl, forKey: "subscription_url")
        }
        if svnUrl != nil{
            aCoder.encode(svnUrl, forKey: "svn_url")
        }
        if tagsUrl != nil{
            aCoder.encode(tagsUrl, forKey: "tags_url")
        }
        if teamsUrl != nil{
            aCoder.encode(teamsUrl, forKey: "teams_url")
        }
        if treesUrl != nil{
            aCoder.encode(treesUrl, forKey: "trees_url")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if watchers != nil{
            aCoder.encode(watchers, forKey: "watchers")
        }
        if watchersCount != nil{
            aCoder.encode(watchersCount, forKey: "watchers_count")
        }
        
    }
    
}
