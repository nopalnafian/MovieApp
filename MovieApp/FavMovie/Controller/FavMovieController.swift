//
//  FavMovieController.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import UIKit
import CoreData

class FavMovieController: UIViewController {
    
    private var favMovieView: FavMovieView!
    private var listCellIdentifier = "listCellIdentifier"
    var favMovie = [MovieDummyModel]()
    var favMovieNew = [Favourite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.favMovieView = FavMovieView(frame: self.view.frame)
        self.view = self.favMovieView

        
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Fav Movie"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        
        getFav()
        settingNotificationCenter()
        
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .systemBlue
        getData()
        setupCV()
    }
    
    func settingNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: NSNotification.Name(rawValue: "updateData"), object: .none)
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        let userInfo = notification.userInfo
        if (userInfo!["update"] != nil) == true {
            getFav()
        }
        
    }
    
    func getFav() {
        let fetchRequest : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        
        do {
            let fav = try PersistenceService.context.fetch(fetchRequest)
            self.favMovieNew = fav
            favMovieView.collectionView.reloadData()
//            printFav()
        } catch {
            
        }
        
    }
    
//    func printFav() {
//        favMovieNew.forEach({print($0.movieTitle)})
//    }
    
    func getData() {
        favMovie = MovieDummyModel.getDummyDataFavorite()
    }
    
    func setupCV() {
        favMovieView.collectionView.register(listCell.self, forCellWithReuseIdentifier: listCellIdentifier)
        
        favMovieView.collectionView.delegate = self
        favMovieView.collectionView.dataSource = self
    }
}


extension FavMovieController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favMovieNew.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellIdentifier, for: indexPath) as! listCell
        cell.cellDataFavNew = favMovieNew[indexPath.item]
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
        
//        print("tapped", indexPath.item)
        let detailMovie = DetailMovieController()
        detailMovie.movieId = Int(favMovieNew[indexPath.item].movieId!)
        navigationController?.pushViewController(detailMovie, animated: true)
    }


}
