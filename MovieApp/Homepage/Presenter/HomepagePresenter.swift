//
//  HomepagePresenter.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import Foundation
class HomepagePresenter: HomepagePresenterProtocol {

    weak var view: HomepageControllerProtocol?
    var interactor: HomepageInteractorProtocol?
    var wireframe: HomepageWireframeProtocol?
    
    func getDataFromAPI(category: APICallManager.Endpoint) {
        interactor?.getDataFromAPI(category: category)
    }
    
    func displayData(data: MoviesResponseNew) {
        view?.displayData(data: data)
    }
    
    func navigateToFavourite(view: HomepageController) {
        wireframe?.navigateToFavourite(view: view)
    }
    
    func navigateToDetail(view: HomepageController, id: Int) {
        wireframe?.navigateToDetail(view: view, id: id)
    }
    


    
}
