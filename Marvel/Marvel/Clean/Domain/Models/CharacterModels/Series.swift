//
//  Series.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct Series: Codable{
    let available: Int
    let collectionURI: String
    let items: [SeriesItem]
    let returned: Int
}
