//
//  MovieRepository.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

import Foundation
import Combine

protocol CharacterRepository{
    func fetchAllCharactersData() -> AnyPublisher<[Character], CharacterError>
}

class CharacterApiFetch: CharacterRepository{
    
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
    
}

