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
    Header {
      Div {
        Navigation {
          Link("Home", url: "/")
            .class("nav__link")
          for sectionId in Site.SectionID.allCases {
            let section = context.sections[sectionId]
            ComponentGroup(
              members: [
                Span("•").class("nav__seperator"),
                Link(section.id.rawValue.capitalized, url: section.path.absoluteString).class("nav__link")
              ]
            )
          }
        }
      }
      .class("header")
    }
  }
}
