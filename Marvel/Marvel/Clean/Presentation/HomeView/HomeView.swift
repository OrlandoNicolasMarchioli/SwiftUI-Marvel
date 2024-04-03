//
//  HomeView.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel(moviesFetched: [], movieFetchUseCase: DefaultCharacterFetchUseCase(characterRepository: CharacterApiFetch(movieApi: MarvelApi())))
    @State var movies: [Character] = []

    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ZStack{
            Image("ImageBackGround")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(){
                HStack{
                    Button(action: {
                    }) {
                        Image(systemName:"list.bullet")
                            .foregroundColor(.black)
                    }
                    .padding(.leading)
                    Spacer()
                    Image("MarvelLogo")
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }.padding(.trailing)
                }
                .frame(height: 64)
                .background(.white)
                .padding(.top)
                Spacer()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        CharacterView()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            homeViewModel.fetchCharacters()
        }
        .safeAreaPadding(.top,100)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



