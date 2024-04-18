//
//  MovieApi.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

protocol MarvelApiProtocol {
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)
    func fetchComicsData(completion: @escaping (ComicDataWrrapper?, Error?) -> Void)
    func getAllCharacters() -> [Character]
}

class MarvelApi: MarvelApiProtocol {
    
    private var characters: [Character] = []
    private var comics: [Comic] = []
    private var baseUrl: String
    var urlsSession: URLSession
    
    init(baseUrl: String = "BASE_URL" ,urlsSession: URLSession = URLSession.shared) {
        self.baseUrl = baseUrl
        self.urlsSession = urlsSession
    }
    
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        let urlString = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: baseUrl, path: "characters?")
                
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }
        
        performDataTask(urlString: urlString, completion: completion, decodingType: AllCharactersResponse.self, extractResponse: extractAllCharactersFromResponse(response:))
    }
    
    func fetchComicsData(completion: @escaping (ComicDataWrrapper?, Error?) -> Void) {
        let urlString = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: baseUrl, path: "comics?")
                
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }
        
        performDataTask(urlString: urlString, completion: completion, decodingType: ComicDataWrrapper.self, extractResponse: extractAllComicsFromResponse(response:))
    }
    
    private func performDataTask<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void, decodingType: T.Type, extractResponse: @escaping (T) -> Void) {
         guard let url = URL(string: urlString) else {
             completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
             return
         }
         
         urlsSession.dataTask(with: url) { data, _, error in
             guard let data = data, error == nil else {
                 print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                 DispatchQueue.main.async {
                     completion(nil, error)
                 }
                 return
             }
             
             do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode(decodingType, from: data)
                 extractResponse(response)
                 DispatchQueue.main.async {
                     completion(response, nil)
                 }
             } catch {
                 print("Error decoding data: \(error.localizedDescription)")
                 DispatchQueue.main.async {
                     completion(nil, error)
                 }
             }
         }.resume()
     }

    
    private func extractAllCharactersFromResponse(response : AllCharactersResponse) -> Void{
        self.characters.append(contentsOf: response.data.results)
    }
    
    private func extractAllComicsFromResponse(response : ComicDataWrrapper) -> Void{
        self.comics.append(contentsOf: response.data?.results ?? [])
    }
    
    private func validateCredentialsAndUrl(credentials: String, url: String, path: String) -> String{
        guard let credentials = NSLocalizedString(credentials, comment: "") as String?,
              let baseURLString = NSLocalizedString(url, comment: "") as String? else {
            print("Error: Could not retrieve localized strings.")
            return ""
        }
        return baseURLString + path + credentials
    }
    
    func getAllCharacters() -> [Character]{
        return self.characters
    }

}
