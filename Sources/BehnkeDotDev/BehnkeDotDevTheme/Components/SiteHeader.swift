//
//  SiteHeader.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct SiteHeader<Site: Website>: Component {
  var context: PublishingContext<Site>
  var body: Component {
    if BehnkeDotDev.sectionsToDisplay.count == 0 { return EmptyComponent()}
    return Header {
      Div {
        Navigation {
          Link("Home", url: "/")
            .class("nav__link")
          for sectionId in Site.SectionID.allCases {
            let section = context.sections[sectionId]
            if (BehnkeDotDev.sectionsToDisplay.contains(section.id.rawValue)){
              ComponentGroup(
                members: [
                  Span("•").class("nav__seperator"),
                  Link(section.id.rawValue.capitalized, url: section.path.absoluteString).class("nav__link")
                ]
              )
            }
          }
        }
      }
      .class("header")
    }
  }
}
