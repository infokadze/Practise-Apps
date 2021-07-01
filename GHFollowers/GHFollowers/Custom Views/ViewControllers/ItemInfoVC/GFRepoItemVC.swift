//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Harry Crocks on 14.06.2021.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPink, title: "GitHub Profile")
    }
    
    override func actionButonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
