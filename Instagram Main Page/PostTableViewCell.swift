//
//  PostTableViewCell.swift
//  Instagram Main Page
//
//  Created by User on 2/3/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    lazy var userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30 / 2
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.systemPink.cgColor
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "like"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var userNameLabelBeforeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(post: PostModel, userImage: String, userName: String) {
        postImageView.image = post.image
        postTitleLabel.text = post.title
        userAvatarImageView.image = UIImage(named: userImage)
        userNameLabel.text = userName
        userNameLabelBeforeTitle.text = userName
    }
}
extension PostTableViewCell {
    private func setupUI() {
        let postElements = [postImageView, postTitleLabel, userAvatarImageView,userNameLabel, likeButton, userNameLabelBeforeTitle]
        postElements.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            userAvatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            userAvatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 30),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 30),
            
            userNameLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 10),
            
            postImageView.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: 5),
            postImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 350),
            
            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 2),
            likeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            userNameLabelBeforeTitle.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 2),
            userNameLabelBeforeTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            postTitleLabel.centerYAnchor.constraint(equalTo: userNameLabelBeforeTitle.centerYAnchor),
            postTitleLabel.leadingAnchor.constraint(equalTo: userNameLabelBeforeTitle.trailingAnchor, constant: 5),
            postTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
