//
//  MovieRepository.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation
import Combine

protocol MarvelRepository{
    func fetchAllCharactersData() -> AnyPublisher<[Character], CharacterError>
    func fetchAllComicsData() -> AnyPublisher<[Comic], ComicError>
}

class MarvelApiFetch: MarvelRepository{
    
    private var marvelApi: MarvelApiProtocol
    
    init(movieApi: MarvelApiProtocol) {
        self.marvelApi = movieApi
    }
    
    
    func fetchAllCharactersData() -> AnyPublisher<[Character], CharacterError> {
        return Future<[Character], CharacterError> { promise in
            self.marvelApi.fetchCharactersData(){ (response, err) in
                guard let response = response, err == nil else {
                    promise(.failure(.badCredentials))
                    return
                }
                promise(.success(response.data.results))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchAllComicsData() -> AnyPublisher<[Comic], ComicError> {
        return Future<[Comic], ComicError> { promise in
            self.marvelApi.fetchComicsData(){ (response, err) in
                guard let response = response, err == nil else {
                    promise(.failure(.badFetch))
                    return
                }
                promise(.success(response.data?.results ?? []))
            }
        }
        .eraseToAnyPublisher()
    }
    
}

