//
//  MarvelApp.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 20/03/2024.
//

import SwiftUI

@main
struct MarvelApp: App {
    var body: some Scene {
        WindowGroup {
          HomeView(homeViewModel: HomeViewModel(movieFetchUseCase: DefaultMarvelFetchUseCase(characterRepository: MarvelApiFetch(movieApi: MarvelApi.getInstance()))))
        }
    }
}
