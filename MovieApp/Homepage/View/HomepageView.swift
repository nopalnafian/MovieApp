//
//  HomePageView.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import UIKit

class HomepageView: UIView {

    
    let collectionView1 : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
//        flow.minimumLineSpacing = 0;

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    let categoryButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.setTitle("Category", for: .normal)
        btn.titleLabel?.tintColor = UIColor.white
        
        
        
        return btn
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        addSubview(collectionView1)
        collectionView1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        addSubview(categoryButton)
        categoryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        categoryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        categoryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        categoryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
