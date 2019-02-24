//
//  SearchCell.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 24/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    //MARK: IBoutlets
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    private var repoUrl:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 15
        
    }
    
    func configureCell(repo:Repo){
        repoNameLabel.text = repo.name
        repoDescriptionLabel.text = repo.description
        forksCountLabel.text = "\(repo.numbersOfForks)"
        languageLabel.text = repo.language
        repoUrl = repo.repoUrl
    }
}
