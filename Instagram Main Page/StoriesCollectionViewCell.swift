//
//  StoriesCollectionViewCell.swift
//  Instagram Main Page
//
//  Created by User on 2/3/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    private let userStoriesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 65 / 2
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.systemPink.cgColor
        return imageView
    }()
    
    private let userStoriesNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(userStoriesImageView)
        contentView.addSubview(userStoriesNameLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        userStoriesNameLabel.frame = CGRect(x: 0, y: 65, width: 60, height: 15)
        userStoriesImageView.frame = contentView.bounds
    }
    
    public func setDataToCells(imageName: String, userName: String) {
        userStoriesImageView.image = UIImage(named: imageName)
        userStoriesNameLabel.text = userName
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userStoriesImageView.image = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
