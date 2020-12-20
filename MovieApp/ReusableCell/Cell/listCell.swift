//
//  HomePageCell.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import UIKit

class listCell: UICollectionViewCell {
    
//    let dateFormatter = DateFormatter()
    var cellData : MovieModel? {
        didSet {
            self.titleLabel.text = cellData?.title
            self.descLabel.text = cellData?.overview
            self.coverImage.downloaded(from: cellData!.backdropUrl, contentMode: .scaleToFill)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY, MMM d"
            // Convert Date to String
            let releaseDate = dateFormatter.string(from: cellData!.releaseDate)
            self.dateLabel.text = releaseDate
            
        }
    }
    
//    var cellDataFav : MovieDummyModel? {
//        didSet {
//            self.titleLabel.text = cellDataFav?.movieTitle
//            self.dateLabel.text = cellDataFav?.releaseDate
//            self.descLabel.text = cellDataFav?.desc
//        }
//    }
    
    var cellDataFavNew : Favourite? {
        didSet {
            self.titleLabel.text = cellDataFavNew?.movieTitle
            self.dateLabel.text = cellDataFavNew?.releaseDate
            self.descLabel.text = cellDataFavNew?.synopsis
            let imagePath = cellDataFavNew?.image
            var backdropUrl : URL {
                return URL(string: "https://image.tmdb.org/t/p/w500\(imagePath ?? "")")!
            }
            self.coverImage.downloaded(from: backdropUrl, contentMode: .scaleToFill)
        }
    }
   
    let coverImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "defaultCover")
//        img.contentMode = .scaleToFill
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movie Title"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "release date"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    //        backgroundColor = .systemGray
        setCellShadow()
        setupView()

    }
    
    func setupView() {
        addSubview(coverImage)
        coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        coverImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(descLabel)
        descLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 20).isActive = true
        descLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}



