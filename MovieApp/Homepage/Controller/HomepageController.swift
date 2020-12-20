//
//  HomePageController.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import UIKit
import CoreData


class HomepageController: UIViewController, HomepageControllerProtocol {

    var favouriteMovie = [Favourite]()
    var presenter: HomepagePresenterProtocol?
    private var homepageView: HomepageView!
    private var listCellIdentifier = "listCellIdentifier"

    var popularMovie = [MovieModel]()
    var upcomingMovie = [MovieModel]()
    var topratedMovie = [MovieModel]()
    
    var currentData = "popular"

    let navbarLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Movie App"
        return label
    }()
    
    let favButton : UIImage = {
        let image = UIImage(systemName: "suit.heart.fill")
        image?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        return image!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomepageWireframe.createMainModule(homepageRef: self)
        
        navigationController?.navigationBar.isHidden = false
        self.homepageView = HomepageView(frame: self.view.frame)
        self.view = self.homepageView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navbarLabel)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: favButton, style:.plain, target: self, action: #selector(favClicked))
        
        self.navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        let fetchRequest : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        
        do {
            let fav = try PersistenceService.context.fetch(fetchRequest)
            self.favouriteMovie = fav
        } catch {
            
        }
        
        
        tapFunction()
        getData()
        setupCV()
    }
    
    func tapFunction() {
        homepageView.categoryButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
    }
    
    @objc func favClicked() {
        presenter?.navigateToFavourite(view: self)
    }
    
    @objc func openAlert() {
        
        let actionSheet = UIAlertController(title: "Choose Category", message: nil, preferredStyle: .actionSheet)
        
        let popularMovie = UIAlertAction(title: "Popular", style: .default) { [self] (action) in
            self.currentData = "popular"
            presenter?.getDataFromAPI(category: .popular)
            reloadDataCV()
        }
        
        let upcomingMovie = UIAlertAction(title: "Upcoming", style: .default) { [self] (action) in
            self.currentData = "upcoming"
            presenter?.getDataFromAPI(category: .upcoming)
            reloadDataCV()
        }
        
        let topratedMovie = UIAlertAction(title: "Top Rated", style: .default) { [self] (action) in
            self.currentData = "toprated"
            presenter?.getDataFromAPI(category: .topRated)
            reloadDataCV()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(popularMovie)
        actionSheet.addAction(upcomingMovie)
        actionSheet.addAction(topratedMovie)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func displayData(data: MoviesResponseNew) {
        currentData = "popular"
        popularMovie = data.results
        reloadDataCV()
    }
    
    func reloadDataCV() {
        DispatchQueue.main.async { [self] in
            homepageView.collectionView1.reloadData()
        }
    }
    
    
    func getData() {
        presenter?.getDataFromAPI(category: .popular)
    }

    
    func setupCV() {
        homepageView.collectionView1.register(listCell.self, forCellWithReuseIdentifier: listCellIdentifier)
        homepageView.collectionView1.delegate = self
        homepageView.collectionView1.dataSource = self
    }



}

extension HomepageController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if currentData == "popular" {
            return popularMovie.count
        } else if currentData == "upcoming" {
            return upcomingMovie.count
        } else if currentData == "toprated" {
            return upcomingMovie.count
        } else {
            return upcomingMovie.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellIdentifier, for: indexPath) as! listCell
        if currentData == "popular" {
            cell.cellData = popularMovie[indexPath.item]
        } else if currentData == "upcoming" {
            cell.cellData = upcomingMovie[indexPath.item]
        } else if currentData == "toprated" {
            cell.cellData = topratedMovie[indexPath.item]
        }
        
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var idTapped : Int? 
        if currentData == "popular" {
            idTapped = popularMovie[indexPath.item].id
        } else if currentData == "upcoming" {
            idTapped = upcomingMovie[indexPath.item].id
        } else if currentData == "toprated" {
            idTapped = topratedMovie[indexPath.item].id
        }

        presenter?.navigateToDetail(view: self, id: idTapped!)
    }
    
    
}
