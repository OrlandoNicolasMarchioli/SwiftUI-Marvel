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
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        
                    }
                }
            },receiveValue: {
                movies in
                self.moviesFetched = movies
            })
            .store(in: &cancellables)
    }
    
    
}
