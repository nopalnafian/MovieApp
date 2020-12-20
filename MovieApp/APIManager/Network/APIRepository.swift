//
//  APIRepository.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 19/12/20.
//

//import Foundation
//class APIRepository {
//    var session: URLSession!
//    func getMovies(completion: @escaping ([MovieModel]?, Error?) -> Void) {
//        guard let url = URL(string: "https://mymovieslist.com/topmovies")
//        else { fatalError() }
//        session.dataTask(with: url) { (_, _, _) in }
//    }
//    
//}
//
//
//
//class MockURLSession: URLSession {
//    var cachedUrl: URL?
//    
//    override func dataTask(with url: URL, completionHandler:      @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        self.cachedUrl = url
//        return URLSessionDataTask()
//    }
//}



