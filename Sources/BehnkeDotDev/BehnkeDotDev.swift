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
  }
  
  struct ItemMetadata: WebsiteItemMetadata {
    var link: String?
    var scale: String?
  }

  static let sectionsToDisplay: Set<String> = ["about", "posts", "projects"]

  var url = URL(string: "https://behnke.dev")!
  var title = "Behnke Dot Dev"
  var name = "John Behnke"
  var description = "John Behnke's personal website"
  var language: Language { .english }
  var imagePath: Path? { .some("images/social-previews/home.png") }
}
