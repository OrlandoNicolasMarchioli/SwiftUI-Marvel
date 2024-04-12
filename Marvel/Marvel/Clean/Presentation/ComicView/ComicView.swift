//
//  ComicView.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 04/04/2024.
//
import SwiftUI

struct ComicView: View {
    var comics: [ComicData]
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    var body: some View {
        ZStack{
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(comics, id: \.id) { comic in
                    HomeCellChip<ComicData>(item: comic,
                                            getMovieImageUrl: {item in item.thumbnail.path + "." + item.thumbnail.fileExtension},
                                            getMovieName: {item in item.title},
                                            onChipTapped: {
                        
                    })
                }
            }
        }
    }
}

#Preview {
    ComicView(comics: [])
}

