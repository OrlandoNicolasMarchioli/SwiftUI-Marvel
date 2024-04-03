//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject{
    @Published var moviesFetched : [Movie] = []
    private let movieFetchUseCase : DefaultMovieFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(moviesFetched: [Movie], movieFetchUseCase: DefaultMovieFetchUseCase) {
        self.moviesFetched = moviesFetched
        self.movieFetchUseCase = movieFetchUseCase
    }
    
    func fetchMovies() {
        movieFetchUseCase.getMovies()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        //TODO: Manage error
                    }
                }
            },receiveValue: {
                movies in DispatchQueue.main.async {
                    self.moviesFetched = movies
                }
            })
            .store(in: &cancellables)
    }
    
    
}
