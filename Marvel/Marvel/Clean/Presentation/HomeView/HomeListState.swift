//
//  HomeViewState.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 03/04/2024.
//

import Foundation

struct HomeListState{
    let characters: [Character]
    let comics: [ComicData]
    let hasError: Bool
    let hasMessage: String
    
    func clone(withCharacters: [Character]? = nil, withComics: [ComicData]? = nil, withHasError: Bool? = nil, withHasMessage: String? = nil) -> HomeListState{
        return HomeListState(characters: withCharacters ?? self.characters, comics: withComics ?? self.comics ,hasError: withHasError ?? hasError, hasMessage: withHasMessage ?? hasMessage)
    }
}
