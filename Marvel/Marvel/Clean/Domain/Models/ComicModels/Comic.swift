//
//  Comic.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct Comic: Codable{
    let id, digitalId: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription, description: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [UrlsItem]?
    let series: SeriesSummary?
    let variants, collections, collectedIssues: [ComicSummary]?
    let dates: [ComicDate]?
    let prices: [ComicPrice]?
    let thumbnail: Thumbnail?
    let images: [ComicImage]?
    let creators: CreatorList?
    let characters: CharacterList?
    let stories: StoryList?
    let events: EventList?
}
