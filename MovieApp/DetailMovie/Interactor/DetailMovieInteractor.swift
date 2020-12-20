//
//  DetailMovieInteractor.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import Foundation
import UIKit

class DetailMovieInteractor: DetailMovieInteractorProtocol {


   
    var presenter: DetailMoviePresenterProtocol?
    
    func getReviewDataFromAPI(movieId: Int) {
        
        APICallManager.instance.fetchMovieReview(movieId: movieId) { [self] (result: Result<ListReview,APICallManager.APIServiceError>) in
            
            switch result {
            case .success(let reviewResponse):
                presenter?.displayReview(data: reviewResponse)
            case .failure(let error):
                print("ERROR guys",error.localizedDescription)
            }
        }
    }

    
    func getDetailMovieData(movieId: Int) {
        
        APICallManager.instance.fetchMovieDetail(movieId: movieId) { [self] (result: Result<MovieModel,APICallManager.APIServiceError>) in
            switch result {
            case .success(let movieResponse):
                presenter?.displayData(data: movieResponse)
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
        
        
        
    }
    
    
//    func getDataFromAPI(category: APICallManager.Endpoint) {
//        APICallManager.instance.fetchMovies(from: category) { [self] (result: Result<MoviesResponseNew,APICallManager.APIServiceError>) in
//            switch result {
//        case .success(let movieResponse):
//            presenter?.displayData(data: movieResponse)
//        case .failure(let error):
//            print("ERROR",error.localizedDescription)
//        }
//        }
//    }

}
