//
//  MovieFetchUseCase.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation
import Combine

protocol MoviFetchUseCase {
    func getMovies() -> AnyPublisher<[Movie], Error>
}

class DefaultMovieFetchUseCase: MoviFetchUseCase {
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func getMovies() -> AnyPublisher<[Movie], Error> {
        return movieRepository.fetchAllMoviesData().map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
}
