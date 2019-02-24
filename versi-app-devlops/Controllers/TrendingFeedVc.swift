//
//  ViewController.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 10/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class TrendingFeedVc: UIViewController {
    //MARK: Variables
    var repos = PublishSubject<[Repo]>()
    var refreshControl = UIRefreshControl()
    var disposeBag = DisposeBag()
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Getting Github repos 😇", attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1),NSAttributedString.Key.font:UIFont(name: "AvenirNext-DemiBold", size: 16.0)!])
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        fetchData()
        //Populate the tableview
        repos.bind(to: tableView.rx.items(cellIdentifier: "TredingRepoCell")){ (row, element:Repo, cell: TrendingRepoCellTableViewCell) in
            cell.configureCell(repo: element)
        }.disposed(by: disposeBag)
        // Do any additional setup after loading the view, typically from a nib.
    }
    // this func retrive data from the Github API
    @objc func fetchData(){
        DownloadService.shared.DownloadTredingReposDictArray { (repos) in
            self.repos.onNext(repos)
            self.refreshControl.endRefreshing()
        }
    }


}

