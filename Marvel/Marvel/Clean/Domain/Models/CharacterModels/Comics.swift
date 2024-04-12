//
//  Comics.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct Comics: Codable{
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}
