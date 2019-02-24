//
//  DownloadService.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 22/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
class DownloadService{
    static let  shared = DownloadService()
    func DownloadTredingReposDictArray(completion:@escaping (_ reposDictArray:[Repo])->()){
        Alamofire.request(trendingRepoURL).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String,Any>
                else{
                return
            }
            guard let repoDictionaryArray = json["items"] as? [Dictionary<String,Any>] else{
                return
            }
            let repos = self.parseDictArray(dict: repoDictionaryArray)
            completion(repos)
        }
}
    func parseDictArray(dict: [Dictionary<String,Any>])->[Repo]{
        var repos = [Repo]()
        for element in dict{
            if (repos.count <= 9){
                //use guard to be sure that your repo contains all the data
                guard let owner = element["owner"] as? Dictionary<String,Any>,
                    let name = element["name"] as? String,
                    let description = element["description"] as? String,
                    let numbersOfForks = element["forks_count"] as? Int,
                    let language = element["language"] as? String,
                    let numberOfContributors = element["contributors_url"] as? String,
                    let RepoUrl = element["html_url"] as? String else{
                        break
                }
                let repo = Repo(image:UIImage(named: "searchIconLarge")!, name: name, description: description, numbersOfForks: numbersOfForks, language: language, numbersOfContributors: 30, repoUrl: RepoUrl)
                repos.append(repo)
                // now load the image  and get the numbers of contributions
                //let avatarUrl = owner["avatar_url"] as? String
                /*self.loadAvatarImage(avatarUrl: avatarUrl!, Completion: { (imageAvatar) in
                    self.getNumbersOfContributors(ContributorsUrl: numberOfContributors, Completion: { (numberContributors) in
                        let repo = Repo(image:imageAvatar, name: name, description: description, numbersOfForks: numbersOfForks, language: language, numbersOfContributors: numberContributors, repoUrl: RepoUrl)
                        repos.append(repo)
                    })
                    
                })*/
            }else{
                break
            }
        }
        return repos
    }
    //this func should get the avatar image
    func loadAvatarImage(avatarUrl:String, Completion: @escaping (_ avatarImage: UIImage)->()){
        Alamofire.request(avatarUrl).responseImage { (imageResponse) in
            guard let image = imageResponse.result.value else {return}
            Completion(image)
        }

    }
    //this func should return the number of contributors
    func getNumbersOfContributors(ContributorsUrl:String, Completion: @escaping (_ numberContributor : Int)-> ()){
        Alamofire.request(ContributorsUrl).responseJSON { (response) in
            guard let json = response.result.value as? [Dictionary<String,Any>] else{
                return
            }
            if !json.isEmpty{
                let contributions = json.count
                Completion(contributions)
            }
        }
    }
}
