//
//  AllCharactersData.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct AllCharactersData: Codable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}
