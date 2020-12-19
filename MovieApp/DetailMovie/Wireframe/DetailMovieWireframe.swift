//
//  DetailMovieWireframe.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import UIKit

class DetailMovieWireframe: DetailMovieWireframeProtocol {
    
    //dependencies injection
    class func createMainModule(detailMovieRef: DetailMovieController) {
        let presenter: DetailMoviePresenterProtocol = DetailMoviePresenter()
        
        detailMovieRef.presenter = presenter
        detailMovieRef.presenter?.wireframe = DetailMovieWireframe()
        detailMovieRef.presenter?.view = detailMovieRef
        detailMovieRef.presenter?.interactor = DetailMovieInteractor()
        detailMovieRef.presenter?.interactor?.presenter = presenter
    }
}
