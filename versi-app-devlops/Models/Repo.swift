//
//  Repo.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 11/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit

class Repo {
    public private(set) var  image:UIImage
    public private(set) var name:String
    public private(set) var description:String
    public private(set) var numbersOfForks:Int
    public private(set) var language:String
    public private(set) var numbersOfContributors:Int
    public private(set) var repoUrl:String
    init(image:UIImage, name:String,description:String,numbersOfForks:Int,language:String,numbersOfContributors:Int,repoUrl:String) {
        self.image = image
        self.name = name
        self.description = description
        self.numbersOfForks = numbersOfForks
        self.language = language
        self.numbersOfContributors = numbersOfContributors
        self.repoUrl = repoUrl
        
        
    }
}
