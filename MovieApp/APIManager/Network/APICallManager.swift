//
//  APICallManager.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import Foundation


class APICallManager {
    static let instance = APICallManager()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    private let apiKey = "fc99d8440c4590e79534f5e911b66de8"
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    // Enum Endpoint
    public enum Endpoint: String, CaseIterable {
        
        case nowPlaying = "now_playing"
        case upcoming = "upcoming"
        case popular = "popular"
        case topRated = "top_rated"
    }
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
        
        var errorDesc: String? {
            switch self {
            case .apiError:
                return "you entered the wrong API"
            case .invalidEndpoint:
                return "you entered the invalid endpoint, try to change it"
            case .invalidResponse:
                return "the response was invalid"
            case .noData:
                return "no data were received from fetching"
            case .decodeError:
                return "error while decoding"
            default:
                return "error"
            }
        }
    }
    
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            
            completion(.failure(.invalidEndpoint))
            return
               
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    print("value", values)
                    completion(.success(values))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            case .failure( _):
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    
    public func fetchMovies(from endpoint: Endpoint, result: @escaping (Result<MoviesResponseNew, APIServiceError>) -> Void) {
        let movieURL = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent(endpoint.rawValue)
        
        //        print("movieUrl", movieURL)
        fetchResources(url: movieURL, completion: result)
    }
    
    
    
    public func fetchMovieDetail(movieId: Int, result: @escaping (Result<MovieModel, APIServiceError>) -> Void) {
        
        
        let movieURL = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent(String(movieId))
        
        
//        print("movieUrl", movieURL)
        fetchResources(url: movieURL, completion: result)
    }
    
    public func fetchMovieReview(movieId: Int, result: @escaping (Result<ListReview, APIServiceError>) -> Void) {
        
        let movieURL = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent("\(movieId)")
            .appendingPathComponent("reviews")
        
        fetchResources(url: movieURL, completion: result)
    }
    
    
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
