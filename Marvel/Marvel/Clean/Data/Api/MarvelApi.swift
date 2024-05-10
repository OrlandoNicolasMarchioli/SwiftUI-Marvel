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
}

class MarvelApi: MarvelApiProtocol {

    static private var shared: MarvelApi?
    private var characters: [Character] = []
    private var comics: [Comic] = []
    private var baseUrl: String
    private var apiKey: String
    private var hash: String
    private var urlsSession: URLSession

    private init(baseUrl: String, apiKey: String, hash: String, urlsSession: URLSession = URLSession.shared ) {
        self.baseUrl = baseUrl
        self.urlsSession = urlsSession
        self.apiKey = apiKey
        self.hash = hash
    }

    //TODO : To be improved 
    static func getInstance() -> MarvelApiProtocol{
      if let returnShared = shared{
        return returnShared
      } else {
        let newInstance =
          MarvelApi(baseUrl: ProcessInfo.processInfo.environment["baseUrl"] ?? "",
                    apiKey: ProcessInfo.processInfo.environment["apiKey"] ?? "",
                    hash: ProcessInfo.processInfo.environment["hash"] ?? "")
        shared = newInstance
        return newInstance
      }
    }
    
    func fetchCharactersData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        guard let url = absoluteURLFactory(host: baseUrl, path: "characters", apiKey: apiKey, hash: hash) else {
            print("Error: Invalid URL")
            return
        }
        performDataTask(urlString: url, completion: completion, decodingType: AllCharactersResponse.self, extractResponse: extractAllCharactersFromResponse(response:))
    }
    
    func fetchComicsData(completion: @escaping (ComicDataWrrapper?, Error?) -> Void) {
        guard let url = absoluteURLFactory(host: baseUrl, path: "comics", apiKey: apiKey, hash: hash) else {
            print("Error: Invalid URL")
            return
        }
        
        performDataTask(urlString: url, completion: completion, decodingType: ComicDataWrrapper.self, extractResponse: extractAllComicsFromResponse(response:))
    }
    
    private func performDataTask<T: Decodable>(urlString: URL, completion: @escaping (T?, Error?) -> Void, decodingType: T.Type, extractResponse: @escaping (T) -> Void) {
         
        urlsSession.dataTask(with: urlString) { data, _, error in
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
  
    private func absoluteURLFactory(host: String, path: String, apiKey: String, hash: String) -> URL?{
      var hostUrl = URL(string: host)
      hostUrl?.append(path: path)
      hostUrl?.append(queryItems: [URLQueryItem(name: "ts", value: "1")])
      hostUrl?.append(queryItems: [URLQueryItem(name: "apikey", value: apiKey)])
      hostUrl?.append(queryItems: [URLQueryItem(name: "hash", value: hash)])
      return hostUrl
    }
}

