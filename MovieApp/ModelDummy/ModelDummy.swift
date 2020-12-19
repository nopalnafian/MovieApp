//
//  ModelDummy.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import Foundation

struct MovieDummyModel {
//    var number: Int?
    var imageUrl: String?
    var movieTitle: String?
    var releaseDate: String?
    var desc: String?

    
    
    static func getDummyDataPopular() -> [MovieDummyModel] {
        var result = [MovieDummyModel]()
        
        let mov1 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Popular Movie 1", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov2 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Popular Movie 2", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov3 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Popular Movie 3", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov4 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Popular Movie 4", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        result.append(mov1)
        result.append(mov2)
        result.append(mov3)
        result.append(mov4)
        return result
    }
    
    static func getDummyDataUpcoming() -> [MovieDummyModel] {
        var result = [MovieDummyModel]()
        
        let mov1 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Upcoming Movie 1", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov2 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Upcoming Movie 2", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov3 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Upcoming Movie 3", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov4 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Upcoming Movie 4", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        result.append(mov1)
        result.append(mov2)
        result.append(mov3)
        result.append(mov4)
        return result
    }
    
    static func getDummyDataTopRated() -> [MovieDummyModel] {
        var result = [MovieDummyModel]()
        
        let mov1 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "TopRated Movie 1", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov2 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "TopRated Movie 2", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov3 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "TopRated Movie 3", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov4 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "TopRated Movie 4", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        result.append(mov1)
        result.append(mov2)
        result.append(mov3)
        result.append(mov4)
        return result
    }
    
    static func getDummyDataFavorite() -> [MovieDummyModel] {
        var result = [MovieDummyModel]()
        
        let mov1 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Favorite Movie 1", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov2 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Favorite Movie 2", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov3 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Favorite Movie 3", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        let mov4 = MovieDummyModel(imageUrl: "defaultCover", movieTitle: "Favorite Movie 4", releaseDate: "1 Jan 2020", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
        
        result.append(mov1)
        result.append(mov2)
        result.append(mov3)
        result.append(mov4)
        return result
    }
    
}
