//
//  GithubRepoCell.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import UIKit
import SDWebImage
import Reusable

class GithubRepoCell: UITableViewCell, NibReusable {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentForCell(_ githubRepo: GithubRepo) {
        avatarImageView.sd_setImage(with: URL(string: githubRepo.owner.avatarURL), completed: nil)
        nameLabel.text = githubRepo.name
    }
}
