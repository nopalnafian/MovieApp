//
//  DetailMovieProtocol.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import UIKit

protocol DetailMovieControllerProtocol: class {
//    func displayData(data: MoviesResponseNew)
    func displayData(data: MovieModel)
    func displayReview(data: ListReview)
    
}

protocol DetailMoviePresenterProtocol: class {
    var view: DetailMovieControllerProtocol? { get set }
    var wireframe: DetailMovieWireframeProtocol? { get set }
    var interactor: DetailMovieInteractorProtocol? { get set }
    
    func getReviewDataFromAPI(movieId : Int)
    func getDetailMovieData(movieId : Int)
    
    func displayData(data: MovieModel)
    func displayReview(data: ListReview)

}

protocol DetailMovieInteractorProtocol: class {
    var presenter: DetailMoviePresenterProtocol? { get set }
//    func getDataFromAPI(category: APICallManager.Endpoint)
    func getReviewDataFromAPI(movieId : Int)
    func getDetailMovieData(movieId : Int)

}

protocol DetailMovieWireframeProtocol: class {
    
}
