//
//  HomepageProtocol.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import UIKit

protocol HomepageControllerProtocol: class {

    func displayData(data: MoviesResponseNew)
}

protocol HomepagePresenterProtocol: class {
    var view: HomepageControllerProtocol? { get set }
    var wireframe: HomepageWireframeProtocol? { get set }
    var interactor: HomepageInteractorProtocol? { get set }
    
    func getDataFromAPI(category: APICallManager.Endpoint)
    func displayData(data: MoviesResponseNew)
    func navigateToFavourite(view : HomepageController)
    func navigateToDetail(view : HomepageController, id: Int)
    

}

protocol HomepageInteractorProtocol: class {
    var presenter: HomepagePresenterProtocol? { get set }
    func getDataFromAPI(category: APICallManager.Endpoint)

}

protocol HomepageWireframeProtocol: class {
    func navigateToFavourite(view : HomepageController)
    func navigateToDetail(view : HomepageController, id: Int)
}


