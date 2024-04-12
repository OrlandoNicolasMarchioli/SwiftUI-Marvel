//
//  MovieFetchUseCase.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation
import Combine

protocol MarvelFetchUseCase {
    func getCharacters() -> AnyPublisher<[Character], Error>
    func getComics() -> AnyPublisher<[ComicData],Error>
}

class DefaultMarvelFetchUseCase: MarvelFetchUseCase {
    
    private let marvelRepository: MarvelRepository
    
    init(characterRepository: MarvelRepository) {
        self.marvelRepository = characterRepository
    }
    
    func getCharacters() -> AnyPublisher<[Character], Error> {
        return marvelRepository.fetchAllCharactersData().map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
    func getComics() -> AnyPublisher<[ComicData], Error> {
        return marvelRepository.fetchAllComicsData().map{result in
                return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
}
