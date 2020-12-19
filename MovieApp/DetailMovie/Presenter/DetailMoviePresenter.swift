//
//  DetailMoviePresenter.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import Foundation
class DetailMoviePresenter: DetailMoviePresenterProtocol {

    weak var view: DetailMovieControllerProtocol?
    var interactor: DetailMovieInteractorProtocol?
    var wireframe: DetailMovieWireframeProtocol?
    
    func getReviewDataFromAPI(movieId: Int) {
        interactor?.getReviewDataFromAPI(movieId: movieId)
    }
    
    func getDetailMovieData(movieId: Int) {
        interactor?.getDetailMovieData(movieId: movieId)
    }
    

    func displayData(data: MovieModel) {
        view?.displayData(data: data)
    }
    
    func displayReview(data: MovieModel) {
        view?.displayData(data: data)
    }
    
    func displayReview(data: ListReview) {
        view?.displayReview(data: data)
    }

}
