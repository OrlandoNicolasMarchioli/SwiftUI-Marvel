//
//  MovieApi.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

protocol MarvelApiProtocol {
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)
    func getAllCharacters() -> [Character]
}

class MarvelApi: MarvelApiProtocol {
    
    var movies: [Character] = []
    
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        guard let credentials = NSLocalizedString("CREDENTIALS", comment: "") as String?,
              let baseURLString = NSLocalizedString("GET_ALL_CHARACTERS_URL", comment: "") as String? else {
            print("Error: Could not retrieve localized strings.")
            return
        }
        
        let urlString = baseURLString + credentials
        
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(AllCharactersResponse.self, from: data)
                self.extractAllMoviesFromResponse(response: response)
                completion(response, nil)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
    }

    
    private func extractAllMoviesFromResponse(response : AllCharactersResponse) -> Void{
        let allCharactersData = response.data
        for movie in allCharactersData.results{
            self.movies.append(movie)
        }
    }
    
    func getAllCharacters() -> [Character]{
        return self.movies
    }
}
