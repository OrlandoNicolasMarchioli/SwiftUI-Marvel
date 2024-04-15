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
    static let defaultState = HomeListState(characters: [], comics: [], hasError: false, hasMessage: "", isCharactersPersent: false, isComicsPresent: true)
    private let marvelFetchUseCase : DefaultMarvelFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: HomeListState = defaultState, movieFetchUseCase: DefaultMarvelFetchUseCase) {
        self.state = initialState
        self.marvelFetchUseCase = movieFetchUseCase
    }
    
    func fetchMarvelData() -> Void{
        fetchCharacters()
        fetchComics()
    }
    
    func fetchCharacters() {
        marvelFetchUseCase.getCharacters()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone(withHasError: true,withHasMessage: error.localizedDescription))!
                    }
                }
            },receiveValue: {
                characters in DispatchQueue.main.async {
                    self.state = self.state.clone(withCharacters:characters,withHasError: false)
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchComics(){
        marvelFetchUseCase.getComics()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.state = (self?.state.clone(withHasError: true,withHasMessage: error.localizedDescription))!
                    }
                }
            },receiveValue: {
                comics in DispatchQueue.main.async {
                    self.state = self.state.clone(withComics:comics,withHasError: false)
                }
            })
            .store(in: &cancellables)
    }
    
    func handleMenuComicSelection(){
        self.state = state.clone(withIsisCharactersPersent: false,withIsComicsPresent: true)
    }
    
    func handleMenuCharacterSelection(){
        self.state = state.clone(withIsisCharactersPersent: true,withIsComicsPresent: false)
    }
    
}
