//
//  ReviewCell.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
//    let dateFormatter = DateFormatter()
    var cellData : DetailReview? {
        didSet {
            
            print("data", cellData)
            self.nameLabel.text = cellData?.authorDetails.name
            self.usernameLabel.text = cellData?.authorDetails.username
            self.contentLabel.text = cellData?.content
//            self.titleLabel.text = cellData?.title
//            print("release date", cellData?.releaseDate)
//
//            self.descLabel.text = cellData?.overview
//
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "YYYY, MMM d"
//            // Convert Date to String
//            let releaseDate = dateFormatter.string(from: cellData!.releaseDate)
//            self.dateLabel.text = releaseDate

        }
    }
    
//    var cellDataFav : MovieDummyModel? {
//        didSet {
//            self.titleLabel.text = cellDataFav?.movieTitle
//            self.dateLabel.text = cellDataFav?.releaseDate
//            self.descLabel.text = cellDataFav?.desc
//        }
//    }
   
//    let coverImage : UIImageView = {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.image = UIImage(named: "defaultCover")
////        img.contentMode = .scaleToFill
//        return img
//    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Switch"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "maketheSwitch"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let contentLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex'"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setCellShadow()
        setupView()

    }
    
    func setupView() {
//        addSubview(coverImage)
//        coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
//        coverImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        coverImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        coverImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
//
        addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(usernameLabel)
        usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(contentLabel)
        contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        contentLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
//        addSubview(dateLabel)
//        dateLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
//        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
//        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//
//        addSubview(descLabel)
//        descLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
//        descLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4).isActive = true
//        descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}



