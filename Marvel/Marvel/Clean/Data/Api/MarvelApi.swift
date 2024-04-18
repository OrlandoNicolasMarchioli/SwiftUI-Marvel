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

    static private var shared: MarvelApi?

    //TODO : To be improved 
    static func getInstance() -> MarvelApiProtocol{
      if let returnShared = shared{
        return returnShared
      } else {
        let newInstance =
          MarvelApi(baseUrl: "https://gateway.marvel.com:443/v1/public/",
                  apiKey: "b209d62336cd3526e0eb13f0bb429891&hash=ac374d862543660c1a035d30825a7a27")
        shared = newInstance
        return newInstance
      }
    }


    private var characters: [Character] = []
    private var comics: [Comic] = []
    private var baseUrl: String
    private var apiKey: String
    private var urlsSession: URLSession

    private init(baseUrl: String, apiKey: String, urlsSession: URLSession = URLSession.shared ) {
        self.baseUrl = baseUrl
        self.urlsSession = urlsSession
        self.apiKey = apiKey
    }
    
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        guard let url = absoluteURLFactory(host: baseUrl, path: "characters", apiKey: apiKey) else {
            print("Error: Invalid URL")
            return
        }
        performDataTask(urlString: url.absoluteString, completion: completion, decodingType: AllCharactersResponse.self, extractResponse: extractAllCharactersFromResponse(response:))
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
    
    private func validateCredentialsAndUrl(credentials: String, url: String, path: String) -> String {
        return url + path + credentials
    }
    
    func getAllCharacters() -> [Character]{
        return self.characters
    }
  
    private func absoluteURLFactory(host: String, path: String, apiKey: String) -> URL?{
      var hostUrl = URL(string: host)
      hostUrl?.append(path: "characters")
      hostUrl?.append(queryItems: [URLQueryItem(name: "ts", value: "1")])
      hostUrl?.append(queryItems: [URLQueryItem(name: "apikey", value: apiKey)])
      return hostUrl
    }
}

