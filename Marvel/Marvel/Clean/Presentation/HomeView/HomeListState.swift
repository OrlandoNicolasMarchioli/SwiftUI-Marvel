//
//  HomeViewState.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 03/04/2024.
//

import Foundation

struct HomeListState{
    let characters: [Character]
    let comics: [Comic]
    let hasError: Bool
    let hasMessage: String
    let isCharactersPersent: Bool
    let isComicsPresent: Bool
    
    func clone(withCharacters: [Character]? = nil, withComics: [Comic]? = nil, withHasError: Bool? = nil, withHasMessage: String? = nil, withIsisCharactersPersent: Bool? = false, withIsComicsPresent: Bool? = true) -> HomeListState{
        return HomeListState(characters: withCharacters ?? self.characters, comics: withComics ?? self.comics ,hasError: withHasError ?? hasError, hasMessage: withHasMessage ?? hasMessage, isCharactersPersent: false , isComicsPresent: true )
    }
}
