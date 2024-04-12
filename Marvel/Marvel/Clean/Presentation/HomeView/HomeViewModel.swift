//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject{
    @Published var state : HomeListState
    static let defaultState = HomeListState(characters: [], hasError: false)
    private let characterFetchUseCase : DefaultCharacterFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: HomeListState = defaultState, movieFetchUseCase: DefaultCharacterFetchUseCase) {
        self.state = initialState
        self.characterFetchUseCase = movieFetchUseCase
    }
    
    func fetchCharacters() {
        characterFetchUseCase.getCharacters()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone(withHasError: true))!
                    }
                }
            },receiveValue: {
                characters in DispatchQueue.main.async {
                    self.state = self.state.clone(withCharacters:characters,withHasError: false)
                }
            })
            .store(in: &cancellables)
    }
    
    
}
