//
//  HomepageInteractor.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import Foundation
import UIKit

class HomepageInteractor: HomepageInteractorProtocol {
   
    var presenter: HomepagePresenterProtocol?
    
    func getDataFromAPI(category: APICallManager.Endpoint) {
        
        APICallManager.instance.fetchMovies(from: category) { [self] (result: Result<MoviesResponseNew,APICallManager.APIServiceError>) in
            switch result {
            case .success(let movieResponse):
                presenter?.displayData(data: movieResponse)
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
    }
        

}
