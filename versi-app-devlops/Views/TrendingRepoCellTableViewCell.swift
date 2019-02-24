//
//  TrendingRepoCellTableViewCell.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 11/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit

class TrendingRepoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoDescLabel: UILabel!
    
    @IBOutlet weak var numbersOfForksLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var contributorsLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var viewReadmeButton: RoundedBorderButton!
    private var repoUrl:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(repo:Repo){
        repoImageView.image = repo.image
        repoNameLabel.text = repo.name
        repoDescLabel.text = repo.description
        languageLabel.text = repo.language
        numbersOfForksLabel.text = String(repo.numbersOfForks)
        contributorsLabel.text = String(repo.numbersOfContributors)
        repoUrl = repo.repoUrl
    }
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
        repoImageView.subviews.first?.contentMode = .scaleAspectFit
    }
}
