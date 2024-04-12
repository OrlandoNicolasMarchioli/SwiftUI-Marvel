//
//  HomeView.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel(movieFetchUseCase: DefaultMarvelFetchUseCase(characterRepository: MarvelApiFetch(movieApi: MarvelApi())))
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("ImageBackGround")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Image("MarvelLogo")
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing)
                    }
                    .frame(height: 64)
                    .background(Color.white)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            CharacterView(characters: homeViewModel.state.characters)
                                .padding(.horizontal)
                            ComicView(comics: homeViewModel.state.comics)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 16)
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.top)
            }
            .onAppear() {
                homeViewModel.fetchMarvelData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



