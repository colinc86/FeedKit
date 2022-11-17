//
//  AtomFeedEntryPrimaryCategory.swift
//  FeedKit
//
//  Created by Colin Campbell on 11/16/22.
//

import Foundation

/// The "arxiv:primary_category" element conveys information about a category
/// associated with an entry or feed.  This specification assigns no
/// meaning to the content (if any) of this element.
public class AtomFeedEntryPrimaryCategory {
  
  /// The element's attributes
  public class Attributes {
    
    /// The "term" attribute is a string that identifies the category to
    /// which the entry or feed belongs.  Category elements MUST have a
    /// "term" attribute.
    public var term: String?
    
    /// The "scheme" attribute is an IRI that identifies a categorization
    /// scheme.  Category elements MAY have a "scheme" attribute.
    public var scheme: String?
    
  }
  
  /// The element's attributes.
  public var attributes: Attributes?
  
  public init() { }
  
}

// MARK: - Initializers

extension AtomFeedEntryPrimaryCategory {
  
  convenience init(attributes attributeDict: [String : String]) {
    self.init()
    self.attributes = AtomFeedEntryPrimaryCategory.Attributes(attributes: attributeDict)
  }
  
}

extension AtomFeedEntryPrimaryCategory.Attributes {
  
  convenience init?(attributes attributeDict: [String : String]) {
    
    if attributeDict.isEmpty {
      return nil
    }
    
    self.init()
    
    self.term   = attributeDict["term"]
    self.scheme = attributeDict["scheme"]
    
  }
  
}

// MARK: - Equatable

extension AtomFeedEntryPrimaryCategory: Equatable {
  
  public static func ==(lhs: AtomFeedEntryPrimaryCategory, rhs: AtomFeedEntryPrimaryCategory) -> Bool {
    return lhs.attributes == rhs.attributes
  }
  
}

extension AtomFeedEntryPrimaryCategory.Attributes: Equatable {
  
  public static func ==(lhs: AtomFeedEntryPrimaryCategory.Attributes, rhs: AtomFeedEntryPrimaryCategory.Attributes) -> Bool {
    return lhs.term == rhs.term &&
           lhs.scheme == rhs.scheme
  }
  
}
