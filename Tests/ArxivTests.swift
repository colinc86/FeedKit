//
//  ArxivTests.swift
//  FeedKit
//
//  Created by Colin Campbell on 11/16/22.
//

import XCTest
import FeedKit

class ArxivTests: BaseTestCase {
  
  func testArxivFeed() {
    
    // Given
    let URL = fileURL("Arxiv", type: "xml")
    let parser = FeedParser(URL: URL)
    
    do {
      // When
      let feed = try parser.parse().get().atomFeed
      
      // Then
      
      XCTAssertNotNil(feed)
      
      XCTAssertEqual(feed?.totalResults, "189889")
      XCTAssertEqual(feed?.startIndex, "0")
      XCTAssertEqual(feed?.itemsPerPage, "10")
      
      // Feed Entries
      XCTAssertEqual(feed?.entries?.first?.authors?.first?.affiliation, "Department of Physics")
      XCTAssertEqual(feed?.entries?.first?.authors?.last?.affiliation, "NMRC, University College, Cork, Ireland")
      
      XCTAssertEqual(feed?.entries?.first?.doi, "10.1063/1.1383585")
      XCTAssertEqual(feed?.entries?.first?.comment, "11 pages, 6 figures, 3 tables, LaTeX209, submitted to The Journal of\n      Chemical Physics")
      XCTAssertEqual(feed?.entries?.first?.journalReference, "J. Chem. Phys. 115, 1626 (2001)")
      XCTAssertEqual(feed?.entries?.first?.primaryCategory?.attributes?.term, "cond-mat.str-el")
      
    } catch {
      XCTFail(error.localizedDescription)
    }
    
    
    
    
  }
  
  func testAtomFeedParsingPerformance() {
    
    self.measure {
      
      // Given
      let expectation = self.expectation(description: "Arxiv Parsing Performance")
      let URL = self.fileURL("Arxiv", type: "xml")
      let parser = FeedParser(URL: URL)
      
      // When
      parser.parseAsync { (result) in
        
        // Then
        expectation.fulfill()
        
      }
      
      self.waitForExpectations(timeout: self.timeout, handler: nil)
      
    }
    
  }
  
}
