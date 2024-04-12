//
//  AllComicsData.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct AllComicsData: Decodable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [ComicData]
}
