//
//  Events.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct EventList: Codable{
    let available, returned: Int?
    let collectionURI: String?
    let items: [EventSummary]?
}
