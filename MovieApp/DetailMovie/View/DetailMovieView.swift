//
//  DetailMovieView.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import UIKit

class DetailMovieView: UIView {
    
    let collectionView : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()

    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCellShadow()
        view.backgroundColor = .white
        return view
    }()
    
    let coverImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "defaultCover")
        img.contentMode = .scaleToFill
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movie Title"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let favouriteButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "suit.heart")
        
        
        btn.setImage(image, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        btn.imageView?.tintColor = .systemRed
        btn.imageView?.backgroundColor = .clear
        return btn
    }()
    
    let overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 8
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "release date"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let reviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Review"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    
    func setupView() {
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        containerView.addSubview(coverImage)
        coverImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        coverImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        containerView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true

        containerView.addSubview(favouriteButton)
        favouriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        favouriteButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive = true
        favouriteButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        containerView.addSubview(overviewLabel)
        overviewLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        overviewLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        
        
        containerView.addSubview(descLabel)
        descLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        descLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 4).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        
        addSubview(reviewLabel)
        reviewLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -8).isActive = true
        reviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
