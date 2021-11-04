//
//  HomeController.swift
//  Spotify
//
//  Created by Harry Crocks on 30.10.2021.
//

import UIKit

class HomeController: UIViewController {
    
    let menuBar = MenuBar()
    let playlistCellID = "playlistID"
    let music: [[Track]] = [playlists, artists, albums]
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PlaylistCell.self , forCellWithReuseIdentifier: playlistCellID)
        cv.backgroundColor = .black
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
//    let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .black
        menuBar.delegate = self
        
        layout()
    }
    
    func layout() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            //menubar
            menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 42),
            
            //collection view
            collectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return music.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: playlistCellID, for: indexPath) as! PlaylistCell
//        cell.backgroundColor = colors[indexPath.item]
        cell.tracks = music[indexPath.item]
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let index = targetContentOffset.pointee.x / view.frame.width
//        menuBar.selectItem(at: Int(index))
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.scrollIndicator(to: scrollView.contentOffset)
    }
}

extension HomeController: MenuBarDelegate {
    
    func didSelectItemAt(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
        
        
    }
    
    
}
