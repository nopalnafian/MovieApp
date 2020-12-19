//
//  NewModelMovie.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import Foundation
import UIKit

public struct MoviesResponseNew: Codable {
    
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [MovieModel]
}

public struct MovieModel: Codable {
    
    public let id: Int
    public let title: String
    public let overview: String
    public let releaseDate: Date
    public let voteAverage: Double
    public let voteCount: Int
    public let adult: Bool
    public let backdropPath: String
    var backdropUrl : URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
}

public struct AuthorModel: Codable {
    
    public let name: String
    public let username: String
    public let avatarPath: String
    public let rating: Int

}

public struct DetailReview: Codable {
    
    public let author: String
    public let authorDetails: AuthorModel
    public let content: String
    public let createdAt: String
    public let id: String
    public let updatedAt: String
    public let url: String

}

public struct ListReview: Codable {
    public let id: Int
    public let results: [DetailReview]
    public let page: Int
    public let totalPages: Int
    public let totalResults: Int
    
}


extension MovieModel {
    
    static var dumies: [MovieModel] {
        return [
            MovieModel.dummy,
            MovieModel.dummy,
            MovieModel.dummy,
            MovieModel.dummy,
            MovieModel.dummy,
            MovieModel.dummy
        ]
    }
    
    static var dummy: MovieModel {
        MovieModel(id: 553604, title: "Honest Thief", overview: "A bank robber tries to turn himself in because he's falling in love and wants to live an honest life...but when he realizes the Feds are more corrupt than him, he must fight back to clear his name.", releaseDate: Date(), voteAverage: 7.1, voteCount: 216, adult: false, backdropPath: "/tYkMtYPNpUdLdzGDUTC5atyMh9X.jpg")
    }
    
}

