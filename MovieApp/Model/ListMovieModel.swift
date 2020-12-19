//
//  listMovieModel.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import UIKit

class ListMovieModel : Codable {
//    var replies:
    var id: String?
    var backdrop_path: String?
    var title: String?
    var release_date: String?
    var poster_path: String?
    var overview: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["backdrop_path"] as? String {
            self.backdrop_path = data
        }
        if let data = dict["title"] as? String {
            self.title = data
        }

        if let data = dict["release_date"] as? String {
            self.release_date = data
        }
        if let data = dict["poster_path"] as? String {
            self.poster_path = data
        }
        if let data = dict["overview"] as? String {
            self.overview = data
        }
    }
    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> ListMovieModel {
        let listMovieModel = ListMovieModel()
        listMovieModel.loadFromDictionary(dict)
        
        return listMovieModel
    }
}
