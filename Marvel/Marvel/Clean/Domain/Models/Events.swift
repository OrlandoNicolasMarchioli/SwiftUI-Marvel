//
//  Events.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct Events: Codable{
    let available: Int
    let collectionURI: String
    let items: [EventsItem]
    let returned: Int
}
