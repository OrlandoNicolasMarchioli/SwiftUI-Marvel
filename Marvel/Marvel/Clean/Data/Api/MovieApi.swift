//
//  MovieApi.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 29/03/2024.
//

import Foundation

protocol MoviesApiProtocol {
    func fetchMovieData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)
    func getAllMovies() -> [Movie]
}

class MoviesApi: MoviesApiProtocol {
    
    var movies: [Movie] = []
    
    init() {
        self.movies = []
    }
    
    func fetchMovieData(completion: @escaping (AllCharactersResponse?, Error?) -> Void)  {
        guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=b209d62336cd3526e0eb13f0bb429891&hash=ac374d862543660c1a035d30825a7a27") else {
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
    
    func getAllMovies() -> [Movie]{
        return self.movies
    }
}
