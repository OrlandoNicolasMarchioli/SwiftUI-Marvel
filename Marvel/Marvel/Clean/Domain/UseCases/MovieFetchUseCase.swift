//
//  MovieFetchUseCase.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation
import Combine

protocol CharacterFetchUseCase {
    func getCharacters() -> AnyPublisher<[Character], Error>
}

class DefaultCharacterFetchUseCase: CharacterFetchUseCase {
    
    private let characterRepository: CharacterRepository
    
    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }
    
    func getCharacters() -> AnyPublisher<[Character], Error> {
        return characterRepository.fetchAllCharactersData().map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
}
