//
//  Character.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 26/03/2024.
//

import Foundation

struct Character: Codable{
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
    let series: Series
    let stories: Stories
    let events: EventList
    let urls: [UrlsItem]
}
