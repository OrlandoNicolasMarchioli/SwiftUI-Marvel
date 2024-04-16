//
//  AllComicsData.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct ComicDataContainer: Codable{
    let offset, limit, total, count: Int?
    let results: [Comic]?
}
