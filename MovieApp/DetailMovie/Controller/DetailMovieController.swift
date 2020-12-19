//
//  DetailMovieController.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import UIKit
import CoreData

class DetailMovieController: UIViewController, DetailMovieControllerProtocol {

    var favMovieNew = [Favourite]()
    var dataReview = [DetailReview]()
    var favMovieId = [String]()
    var isFav : Bool? = false
    private var reviewCellIdentifier = "reviewCellIdentifier"
    private var detailMovieView: DetailMovieView!
    var presenter: DetailMoviePresenterProtocol?
    var dataDetailMovie : MovieModel?
    var movieId : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailMovieWireframe.createMainModule(detailMovieRef: self)
        navigationController?.navigationBar.isHidden = false
        self.detailMovieView = DetailMovieView(frame: self.view.frame)
        self.view = self.detailMovieView


        let backButton = UIBarButtonItem()
        backButton.title = "Detail Movie"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        checkFav()
        getDataFav()
        fetchDataFromId(movieId: movieId!)
        tapFunction()
        getData()
        setupCV()
    }
    
    func tapFunction() {
        detailMovieView.favouriteButton.addTarget(self, action: #selector(favTapped), for: .touchUpInside)
    }
    
    @objc func favTapped() {
        let id = dataDetailMovie?.id
        let name = dataDetailMovie?.title
        let desc = dataDetailMovie?.overview
        let imagePath = dataDetailMovie?.backdropPath

        
        if isFav == false {
            
            isFav = true
            checkFav()

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY, MMM d"
            // Convert Date to String
            let releaseDate = dateFormatter.string(from: dataDetailMovie!.releaseDate)
            
            
            //check fav id
            if favMovieId.contains(String(id!)) {
                //cant add fav
            } else {
                //can add fav
                //add to fav list
                let fav = Favourite(context: PersistenceService.context)
                fav.isFav = isFav ?? false
                fav.movieId = String(id!)
                fav.movieTitle = name
                fav.synopsis = desc
                fav.releaseDate = releaseDate
                fav.image = imagePath
                PersistenceService.saveContext()
            }
            //open alert
            openAlert()
        } else {
            //delete from fav list
            isFav = false
            checkFav()
            deleteFav(id: id!)
            //open alert
            openAlert()
        }
        
        getDataFav()
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: nil, userInfo: ["update" : true])
        
    }
    
    @objc func openAlert() {
        // create the alert
        let alertAdd = UIAlertController(title: "Succes!", message: "Added to favourite", preferredStyle: UIAlertController.Style.alert)
        
        let alertRemove = UIAlertController(title: "Succes!", message: "Remove from favourite", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alertAdd.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alertRemove.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        if isFav == true {
            self.present(alertAdd, animated: true, completion: nil)
        } else {
            self.present(alertRemove, animated: true, completion: nil)
        }
    }
    
    func deleteFav(id: Int) {
        //delete by id
        let indexOfId = favMovieId.firstIndex(of: "\(id)")
        let fetchRequest : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        
        do {
            let fav = try PersistenceService.context.fetch(fetchRequest)
            self.favMovieNew = fav
            PersistenceService.context.delete(fav[indexOfId!])
            getDataFav()
        } catch {
        }
        PersistenceService.saveContext()
    }
    
    func getDataFav() {
        let fetchRequest : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        do {
            let fav = try PersistenceService.context.fetch(fetchRequest)
            self.favMovieNew = fav
            //append to array of fav id
            //create new id array
            favMovieId.removeAll()
            favMovieNew.forEach({self.favMovieId.append($0.movieId!)})
        } catch {
            
        }
    }

    
    func checkFav() {
        //change UI
        if isFav == true {
            detailMovieView.favouriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        } else {
            detailMovieView.favouriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        }
    }
    
    func getData() {
//        print("get review")
        presenter?.getReviewDataFromAPI(movieId: movieId!)
    }
    
    func displayData(data: MovieModel) {
        self.dataDetailMovie = data
        DispatchQueue.main.async { [self] in
            detailMovieView.titleLabel.text = data.title
            detailMovieView.descLabel.text = data.overview
            detailMovieView.coverImage.downloaded(from: dataDetailMovie!.backdropUrl, contentMode: .scaleToFill)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY, MMM d"
            // Convert Date to String
            let releaseDate = dateFormatter.string(from: data.releaseDate)
            detailMovieView.dateLabel.text = releaseDate
            
            //check fav
            let id = String(data.id)
            if favMovieId.contains(id) {
                isFav = true
            } else {
                isFav = false
            }
            checkFav()
        }
    }
    
    func displayReview(data: ListReview) {
//        print("data review", data.results)
        self.dataReview = data.results
    }

    func setupCV() {
        detailMovieView.collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: reviewCellIdentifier)
        detailMovieView.collectionView.delegate = self
        detailMovieView.collectionView.dataSource = self
    }
    
    func fetchDataFromId(movieId: Int) {
        presenter?.getDetailMovieData(movieId: movieId)
        presenter?.getReviewDataFromAPI(movieId: movieId)
    }
    


}

extension DetailMovieController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataReview.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellIdentifier, for: indexPath) as! ReviewCell
        cell.cellData = dataReview[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }


}
