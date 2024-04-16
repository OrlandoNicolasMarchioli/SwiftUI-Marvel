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
    @State var menuOptionSelected: MenuOption = .comics
    @State private var showMenu = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("ImageBackGround")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Menu {
                            Button(action: {
                                homeViewModel.handleMenuComicSelection()
                            }) {
                                Text("Comics")
                            }
                            
                            Button(action: {
                                homeViewModel.handleMenuCharacterSelection()
                            }) {
                                Text("Characters")
                            }
                        } label: {
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
                        VStack() {
                            Text(homeViewModel.state.isTitlePresent)
                                .foregroundColor(Color.white)
                                .font(.title)
                                .bold()
                            switch menuOptionSelected {
                            case .comics:
                                ComicView(comics: homeViewModel.state.comics)
                            case .characters:
                                CharacterView(characters: homeViewModel.state.characters)
                            }
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
            .onReceive(homeViewModel.$state){ state in
                if(state.isComicsPresent){
                    self.menuOptionSelected = .comics
                }else{
                    self.menuOptionSelected = .characters
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



