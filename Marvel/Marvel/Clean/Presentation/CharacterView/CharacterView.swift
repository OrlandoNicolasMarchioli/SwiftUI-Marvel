//
//  CharacterView.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 03/04/2024.
//

import SwiftUI

struct CharacterView: View {
    let characterViewModel = CharacterViewModel(charactersFetched: [], characterFetchUseCase: DefaultCharacterFetchUseCase(characterRepository: CharacterApiFetch(movieApi: MarvelApi())))
    var body: some View {
        ZStack{
            ForEach(characterViewModel.charactersFetched, id: \.id) { character in
                HomeCellChip<Character>(item: character,
                                     getMovieImageUrl: {item in item.thumbnail.path + "." + item.thumbnail.fileExtension},
                                     getMovieName: {item in item.name},
                              onChipTapped: {
                    
                })
            }
        }
    }
}

#Preview {
    CharacterView()
}
