//
//  Comic.swift
//  Marvel
//
//  Created by Orlando Nicolas Marchioli on 12/04/2024.
//

import Foundation

struct ComicData: Decodable{
    let id: Int
    let digitalId: Int
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let description: String
    let modified: String
    let isbn: String
    let upc: String
    let diamondCode: String
    let ean: String
    let issn: String
    let format: String
    let pageCount: Int
    let textObjects: [TextObject]
    let resourceURI: String
    let urls: [UrlsItem]
    let series: Series
    let variants: [EventsItem]
    let collections: [String]
    let collectedIssues: [String]
    let dates: [DateInfo]
    let prices: [PriceInfo]
    let thumbnail: Thumbnail
    let images: [ComicImage]
    let creators: Creators
    let characters: ComicCharacters
    let stories: [Story]
    let events: Events
}
