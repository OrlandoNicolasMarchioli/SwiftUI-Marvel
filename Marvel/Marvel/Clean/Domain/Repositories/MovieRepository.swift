//
//  MovieRepository.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

import Foundation
import Combine

protocol MovieRepository{
    func fetchAllMoviesData() -> AnyPublisher<[Movie], MovieError>
}

class MovieApiFetch: MovieRepository{
    
    private var movieApi: MoviesApiProtocol
    
    init(movieApi: MoviesApiProtocol) {
        self.movieApi = movieApi
    }
    
    
    func fetchAllMoviesData() -> AnyPublisher<[Movie], MovieError> {
        return Future<[Movie], MovieError> { promise in
            self.movieApi.fetchMovieData(){ (response, err) in
                guard let response = response, err == nil else {
                    promise(.failure(.badCredentials))
                    return
                }
                promise(.success(response.data.results))
            }
            let movies = self.movieApi.getAllMovies()
            promise(.success(movies))
        }
        .eraseToAnyPublisher()
    }
    
}

