//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Orlando Nicolas Marchioli on 20/03/2024.
//

import XCTest
@testable import Marvel


class MarvelApiTests: XCTestCase {
    let marvelApi = MarvelApi.getInstance()
    
    func testFetchCharactersData() {
                
        let expectation = self.expectation(description: "fetchCharactersData completion handler is called")
        marvelApi.fetchCharactersData { response, error in
            // Then: Assert that the expected data was returned
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            XCTAssertTrue(response?.data.results.contains { $0.name == "3-D Man" } ?? false)
            
            // Fulfill the expectation to indicate that the async work is complete
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testFetchComicsData() {
                
        let expectation = self.expectation(description: "fetchComicsData completion handler is called")
        marvelApi.fetchComicsData { response, error in
            // Then: Assert that the expected data was returned
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            XCTAssertTrue(response?.data?.results?.contains { $0.title == "Gun Theory (2003) #4" } ?? false)
            
            // Fulfill the expectation to indicate that the async work is complete
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    
    
    
}


