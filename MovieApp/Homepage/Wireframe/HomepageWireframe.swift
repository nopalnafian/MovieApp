//
//  HomepageInteractor.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import UIKit

class HomepageWireframe: HomepageWireframeProtocol {

    class func createMainModule(homepageRef: HomepageController) {
        let presenter: HomepagePresenterProtocol = HomepagePresenter()
        
        homepageRef.presenter = presenter
        homepageRef.presenter?.wireframe = HomepageWireframe()
        homepageRef.presenter?.view = homepageRef
        homepageRef.presenter?.interactor = HomepageInteractor()
        homepageRef.presenter?.interactor?.presenter = presenter
    }
    
    func navigateToFavourite(view: HomepageController) {
        let favVC = FavMovieController()
        
        view.navigationController?.pushViewController(favVC, animated: true)
    }
    
    func navigateToDetail(view: HomepageController, id: Int) {
        let detailVC = DetailMovieController()
        detailVC.movieId = id
        view.navigationController?.pushViewController(detailVC, animated: true)
    }
    

    
    
}
