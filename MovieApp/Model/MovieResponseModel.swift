//
//  MovieResponse.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//


import UIKit

class MovieResponseModel : Codable {

    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [ListMovieModel]?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let data = dict["page"] as? Int {
            self.page = data
        }
        if let data = dict["totalResults"] as? Int {
            self.totalResults = data
        }
        if let data = dict["totalPages"] as? Int {
            self.totalPages = data
        }
        
        
        if let data = dict["results"] as? [[String: AnyObject]] {
            var movie: [ListMovieModel] = [ListMovieModel]()
               for item in data {
                    let single: ListMovieModel = ListMovieModel.build(item)
                    movie.append(single)
               }
            self.results = movie
        }
        

    }
    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> MovieResponseModel {
        let movieResponseModel = MovieResponseModel()
        movieResponseModel.loadFromDictionary(dict)
        
        return movieResponseModel
    }
}
