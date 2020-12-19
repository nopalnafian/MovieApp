//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Mohamad Naufal Nafian on 16/12/20.
//

import XCTest
import CoreData
@testable import MovieApp

class MovieAppTests: XCTestCase {
    
    
    // Test Case 1 : Test fetching movie success,
    // only test for popular because the rest of endpoint is have same format
    func testFetchMoviesSuccess(){
        let movieProvider = APICallManager.instance
        let movieExpectaion = expectation(description: "Popular")
        var movieResponse: MoviesResponseNew?

        movieProvider.fetchMovies(from: .popular) { (result: Result<MoviesResponseNew,APICallManager.APIServiceError>) in
            switch result {
            case .success(let response):
//                print("RES", response)
                movieResponse = response
                movieExpectaion.fulfill()
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
        
        

        waitForExpectations(timeout: 30) { (error) in
          XCTAssertNotNil(movieResponse)
        }
    }
    
    // Test Case 2 : get detail movie
    func testFetchDetailMovie(){
        let movieProvider = APICallManager.instance
        let movieExpectaion = expectation(description: "Movie Detail")
        var movieResponse: MovieModel?
        let mockMovie = MovieModel.dummy
        
        
        movieProvider.fetchMovieDetail(movieId: mockMovie.id) { (result: Result<MovieModel,APICallManager.APIServiceError>) in
            switch result {
            case .success(let response):
                movieResponse = response
                movieExpectaion.fulfill()
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 30) { error in
            // if id is the same, get movie detail is success
            XCTAssertEqual(movieResponse?.id, mockMovie.id)
        }
        
    }
    
    
    // Test Case 3 : get movie review
    func testFetchMovieReview(){
        let movieProvider = APICallManager.instance
        let movieExpectaion = expectation(description: "Movie Review")
        var reviewResponse: ListReview?
        let mockMovie = MovieModel.dummy
        
        movieProvider.fetchMovieReview(movieId: mockMovie.id) {  (result: Result<ListReview,APICallManager.APIServiceError>) in
            
            switch result {
            case .success(let response):
                reviewResponse = response
                movieExpectaion.fulfill()
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 30) { error in
            XCTAssertNotNil(reviewResponse)
        }
        
    }
    
    
    // Test Case 4 : get movie review
    func testAddMovieIdToFavourite() {
        let idAdded = "10000"
        var favMovieNew = [Favourite]()
//        let detailController = DetailMovieController()
        //add to fav list
        let fav = Favourite(context: PersistenceService.context)
        fav.movieId = idAdded
        PersistenceService.saveContext()
        
        //get data from core data
        let fetchRequest : NSFetchRequest<Favourite> = Favourite.fetchRequest()
        do {
            let getFav = try PersistenceService.context.fetch(fetchRequest)
            favMovieNew = getFav
        } catch {
            
        }
        //detect last movie id is equal to "1000"
        //if yes adding fav succes
        XCTAssertEqual(favMovieNew.last?.movieId, idAdded)
        
    }

}
