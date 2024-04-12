//
//  CharacterView.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 03/04/2024.
//

import SwiftUI

struct CharacterView: View {
    var characters: [Character]
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    var body: some View {
        ZStack{
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(characters, id: \.id) { character in
                    HomeCellChip<Character>(item: character,
                                            getMovieImageUrl: {item in item.thumbnail.path + "." + item.thumbnail.fileExtension},
                                            getMovieName: {item in item.name},
                                            onChipTapped: {
                        
                    })
                }
            }
        }
    }
}

#Preview {
    CharacterView(characters: [])
}
