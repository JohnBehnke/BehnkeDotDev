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
        // Add the sections that you want your website to contain here:
        case about
        case posts
        case gallery
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
      var next: String?
      var previous: String?
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://behnke.dev")!
    var title = "Test"
    var name = "John Behnke"
    var description = "A description of PersssssssssonalSite"
    var language: Language { .english }
    var imagePath: Path? { .some("images/social-previews/home.png") }

}
