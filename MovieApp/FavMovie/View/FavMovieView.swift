//
//  FavMovieView.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import UIKit

class FavMovieView: UIView {

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
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
