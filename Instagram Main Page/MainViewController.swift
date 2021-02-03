//
//  MainViewController.swift
//  Instagram Main Page
//
//  Created by User on 2/3/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var storiesData: [User] = [
        User(name: "juliet", image: "avatar1"),
        User(name: "fred", image: "avatar2"),
        User(name: "carl", image: "avatar3"),
        User(name: "ashlie", image: "avatar4"),
        User(name: "sam", image: "avatar5"),
        User(name: "tony", image: "avatar6"),
        User(name: "zara", image: "avatar7"),
        User(name: "ray", image: "avatar8"),
        User(name: "ben", image: "avatar9"),
        User(name: "steve", image: "avatar10")
    ]
    
    var postData: [PostModel] = [
        PostModel(image: images.first, title: "No storyboards"),
        PostModel(image: images.second, title: "5 soft skills for developers"),
        PostModel(image: images.third, title: "What's new in Xcode 11"),
        PostModel(image: images.fourth, title: "Patroen revamp"),
        PostModel(image: images.fifth, title: "How I got raise. $60 - $100"),
        PostModel(image: images.six, title: "Shake Gesture"),
        PostModel(image: images.seven, title: "2019 state of salaries"),
        PostModel(image: images.eight, title: "How to build your app wirelessly"),
        PostModel(image: images.nine, title: "Swift news 70"),
        PostModel(image: images.ten, title: "The 90/90 Rule")
    ]
    
    lazy var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 450
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 65, height: 65)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return storiesCollectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = postData[indexPath.row]
        let images = storiesData[indexPath.row].image
        let names = storiesData[indexPath.row].name
        cell.setData(post: post, userImage: images, userName: names)
        return cell
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as! StoriesCollectionViewCell
        cell.setDataToCells(imageName: storiesData[indexPath.row].image, userName: storiesData[indexPath.row].name)
        return cell
    }
}

extension MainViewController {
    private func setupUI() {
        navBarSetup()
        self.view.backgroundColor = .white
        view.addSubview(postTableView)
        NSLayoutConstraint.activate([
            postTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            postTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
    
    private func navBarSetup() {
        let logoButton = UIButton(type: .system)
        let directLogo = UIButton(type: .system)
        let notificationButton = UIButton(type: .system)
        
        navigationController?.navigationBar.addSubview(logoButton)
        navigationController?.navigationBar.addSubview(directLogo)
        navigationController?.navigationBar.addSubview(notificationButton)
        
        
        logoButton.setBackgroundImage(UIImage(named: "instagram logo-1"), for: .normal)
        logoButton.imageView?.contentMode = .scaleAspectFit
        
        directLogo.setBackgroundImage(UIImage(named: "direct"), for: .normal)
        directLogo.imageView?.contentMode = .scaleAspectFit
        
        notificationButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
        notificationButton.imageView?.contentMode = .scaleAspectFit
        
        directLogo.translatesAutoresizingMaskIntoConstraints = false
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoButton.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 5).isActive = true
        logoButton.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!, constant: 2).isActive = true
        logoButton.bottomAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!, constant: -2).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        directLogo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        directLogo.widthAnchor.constraint(equalToConstant: 25).isActive = true
        directLogo.centerYAnchor.constraint(equalTo: logoButton.centerYAnchor).isActive = true
        directLogo.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: -15).isActive = true
        
        notificationButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        notificationButton.centerYAnchor.constraint(equalTo: logoButton.centerYAnchor).isActive = true
        notificationButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        notificationButton.trailingAnchor.constraint(equalTo: directLogo.leadingAnchor, constant: -20).isActive = true
    }
}
