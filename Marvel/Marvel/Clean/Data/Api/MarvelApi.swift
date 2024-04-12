//
//  MovieApi.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

protocol MarvelApiProtocol {
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)
    func fetchComicsData(completion: @escaping (AllComicsResponse?, Error?) -> Void)
    func getAllCharacters() -> [Character]
}

class MarvelApi: MarvelApiProtocol {
    
    var characters: [Character] = []
    var comics: [ComicData] = []
    
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        let urlString = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: "GET_ALL_CHARACTERS_URL")
                
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
    
    func fetchComicsData(completion: @escaping (AllComicsResponse?, Error?) -> Void) {
        let urlString = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: "GET_ALL_COMICS_URL")
                
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
                let response = try decoder.decode(AllComicsResponse.self, from: data)
                self.extractAllComicsFromResponse(response: response)
                completion(response, nil)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
    }

    
    private func extractAllMoviesFromResponse(response : AllCharactersResponse) -> Void{
        self.characters.append(contentsOf: response.data.results)
    }
    
    private func extractAllComicsFromResponse(response : AllComicsResponse) -> Void{
        self.comics.append(contentsOf: response.data.results)
    }
    
    private func validateCredentialsAndUrl(credentials: String, url: String) -> String{
        guard let credentials = NSLocalizedString(credentials, comment: "") as String?,
              let baseURLString = NSLocalizedString(url, comment: "") as String? else {
            print("Error: Could not retrieve localized strings.")
            return ""
        }
        return baseURLString + credentials
    }
    
    func getAllCharacters() -> [Character]{
        return self.characters
    }

}
