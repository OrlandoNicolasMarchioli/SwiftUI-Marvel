//
//  MovieCell.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import Foundation
import SwiftUI

struct MovieCell<T>: View {
    @State var movie: Character
    
    init(movie: Character) {
        self.movie = movie
    }
    
    var body: some View {
        HStack{
            
        }.padding(.bottom)
    }
}

struct HomeCellChip<T>: View {
    let item: T
    let getMovieImageUrl: ((T) -> String)
    let getMovieName: ((T) -> String)
    let onChipTapped: (() -> Void)
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: convertToSecureURL(getMovieImageUrl(item)))) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()
            Text(getMovieName(item))
                .foregroundColor(Color("MovieTitle"))
                .font(.headline)
                .padding(.top, 3)
        }
    }
}

func convertToSecureURL(_ urlString: String) -> String {
    var secureURLString = urlString
    if urlString.hasPrefix("http://") {
        secureURLString = "https://" + urlString.dropFirst(7)
    }
    return secureURLString
}

#Preview{
    HomeCellChip<SelectedMovieData>(item: SelectedMovieData(imageUrl: "https://placekitten.com/200/300", movieName: "Kitten Fight"), getMovieImageUrl: {item in return item.imageUrl}, getMovieName: {item in return item.movieName}, onChipTapped: {} )
}

