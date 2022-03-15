//
//  PersonalSite.swift
//
//
//  Created by John Behnke on 5/3/20.
//

import Foundation
import Publish
import Plot

struct BehnkeDotDev: Website {
  enum SectionID: String, WebsiteSectionID {
    case posts
    case projects
    case about
  }
  
  struct ItemMetadata: WebsiteItemMetadata {
    var next: String?
    var previous: String?
    var link: String?
  }

  static let sectionsToDisplay: Set<String> = ["about", "posts", "projects"]
  
  enum Layout {
    case masonry
    case flex
  }
  
  
  // Update these properties to configure your website:
  var url = URL(string: "https://behnke.dev")!
  var title = "Behnke"
  var name = "John Behnke"
  var description = "John Behnke's personal website"
  var language: Language { .english }
  var imagePath: Path? { .some("images/social-previews/home.png") }
  
}
