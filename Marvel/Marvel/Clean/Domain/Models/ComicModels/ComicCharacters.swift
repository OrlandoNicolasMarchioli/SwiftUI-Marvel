//
//  ComicCharacters.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct ComicCharacters: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicCharacter]
    let returned: Int
    
}
