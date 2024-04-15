//
//  ComicCharacters.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct CharacterList: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [CharacterSummary]?
}
