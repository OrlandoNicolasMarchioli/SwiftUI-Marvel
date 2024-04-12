//
//  Creators.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct Creators: Decodable {
    let available: Int
    let collectionURI: String
    let items: [Creator]
    let returned: Int
}
