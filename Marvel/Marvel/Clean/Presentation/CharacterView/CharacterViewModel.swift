//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 27/03/2024.
//

import Foundation
import Combine


class CharacterViewModel: ObservableObject{
    @Published var charactersFetched : [Character] = []
    private let characterFetchUseCase : DefaultCharacterFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(charactersFetched: [Character], characterFetchUseCase: DefaultCharacterFetchUseCase) {
        self.charactersFetched = charactersFetched
        self.characterFetchUseCase = characterFetchUseCase
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
                        //TODO: Manage error
                    }
                }
            },receiveValue: {
                characters in DispatchQueue.main.async {
                    self.charactersFetched = characters
                }
            })
            .store(in: &cancellables)
    }
    
    
}
