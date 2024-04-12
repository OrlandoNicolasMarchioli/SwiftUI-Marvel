//
//  Image.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct ComicImage: Decodable {
    let path: String
    let fileExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
}
