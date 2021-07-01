//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Harry Crocks on 14.06.2021.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoView2.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemBlue, title: "Get Followers")
    }
    
    override func actionButonTapped() {
    delegate.didTapGetFollowers(for: user)
    }
}
