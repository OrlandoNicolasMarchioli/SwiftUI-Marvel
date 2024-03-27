//
//  AllCharactersResponse.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct AllCharactersResponse: Codable{
    let code: Int
    let status : String
    let copyright : String
    let attributionText : String
    let attributionHTML: String
    let etag : String
    let data : AllCharactersData
}
