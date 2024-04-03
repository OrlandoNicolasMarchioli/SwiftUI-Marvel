//
//  HomeViewState.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 03/04/2024.
//

import Foundation

struct HomeListState{
    let characters: [Character]
    let hasError: Bool
    
    func clone(withCharacters: [Character]? = nil, withHasError: Bool? = nil) -> HomeListState{
        return HomeListState(characters: withCharacters ?? self.characters, hasError: withHasError ?? hasError)
    }
}
