//
//  SearchVC.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 10/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
class SearchVC: UIViewController {
    
    var disposeBag = DisposeBag()
    //MARK:IBOUtlets
    @IBOutlet weak var searchField: RoundedBorderTextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindElements()
        // Do any additional setup after loading the view.
    }
    
    func bindElements(){
        let searchResult = searchField.rx.text
            //launch the search every 0.5 seconde
            .orEmpty.debounce(0.5,scheduler: MainScheduler.instance)
            .map{
                // convert the text to url query
                $0.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            }.flatMap { (query) ->  Observable<[Repo]>in
                if query == ""{
                    return Observable<[Repo]>.just([])
                }else{
                    let urlSearch = searchURL + query! + starsDescendingSegment
                    var searchRepos = [Repo]()
                    return URLSession.shared.rx.json(url: URL(string: urlSearch)!).map{
                    let results = $0 as AnyObject
                    let items = results.object(forKey: "items") as? [Dictionary<String,Any>] ?? []
                        for item in items{
                            guard let name = item["name"] as? String,
                            let description = item["description"] as? String,
                            let numbersOfForks = item["forks_count"] as? Int,
                            let language = item["language"] as? String,
                            let RepoUrl = item["html_url"] as? String else{
                            break
                            }
                            let repo = Repo(image:UIImage(named: "searchIconLarge")!, name: name, description: description, numbersOfForks: numbersOfForks, language: language, numbersOfContributors: 0, repoUrl: RepoUrl)
                            searchRepos.append(repo)
                        }
                       return searchRepos
                    }
                }
        }.observeOn(MainScheduler.instance)
        //now populate the tableview with the result
        searchResult.bind(to: tableView.rx.items(cellIdentifier: "searchCell")){(row,element:Repo,cell:SearchCell) in
            cell.configureCell(repo: element)
        }.disposed(by: disposeBag)
    }
    
    
}
