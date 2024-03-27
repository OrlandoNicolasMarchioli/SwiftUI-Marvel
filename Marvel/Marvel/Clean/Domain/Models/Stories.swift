//
//  Stories.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct Stories: Codable{
    let available: Int
     let collectionURI: String
     let items: [StoriesItem]
     let returned: Int
}
