//
//  MarvelApiTests.swift
//  MarvelTests
//
//  Created by Orlando Nicolas Marchioli on 17/04/2024.
//

import XCTest
@testable import Marvel

class MarvelApiTests: XCTestCase {
    var marvelApi = MarvelApi()
    var mockURLSession: URLSession!
    var charactersURL: String = ""
    var comicsURL: String = ""
    var marvelResponse = MarvelResponse()
    let decoder = JSONDecoder()
    
    override func setUp() {
        super.setUp()
        let charactersURL = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: "GET_ALL_CHARACTERS_URL")
        let comicsURL = validateCredentialsAndUrl(credentials: "CREDENTIALS", url: "GET_ALL_COMICS_URL")
        let configuration = URLSessionConfiguration.default
        mockURLSession = URLSession(configuration: configuration)
        marvelApi = MarvelApi()
        guard let charactersData = marvelResponse.allCharactersResponseMock.data(using: .utf8) else {
            XCTFail("Failed to convert JSON string to Data")
            return
        }
        guard let comicsData = marvelResponse.allComicsResponseMock.data(using: .utf8) else {
            XCTFail("Failed to convert JSON string to Data")
            return
        }
        
    }
    
    override func tearDown() {
        mockURLSession = nil
        super.tearDown()
    }
    
    func testFetchCharactersDataSuccess() {

    }
    
    func testFetchCharactersDataFailure() {


    }
    
    func testAllCharactersAndAllComicsEncoding(){
        
    }
    
    private func validateCredentialsAndUrl(credentials: String, url: String) -> String{
        guard let credentials = NSLocalizedString(credentials, comment: "") as String?,
              let baseURLString = NSLocalizedString(url, comment: "") as String? else {
            print("Error: Could not retrieve localized strings.")
            return ""
        }
        return baseURLString + credentials
    }
    
}

