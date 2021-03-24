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
    case gallery
    case about
  }
  
  struct ItemMetadata: WebsiteItemMetadata {
    var next: String?
    var previous: String?
  }
  
  let sectionsToDisplay: [SectionID] = [.posts,.gallery]
  
  
  // Update these properties to configure your website:
  var url = URL(string: "https://behnke.dev")!
  var title = "Test"
  var name = "John Behnke"
  var description = "A description of PersssssssssonalSite"
  var language: Language { .english }
  var imagePath: Path? { .some("images/social-previews/home.png") }
  
}
