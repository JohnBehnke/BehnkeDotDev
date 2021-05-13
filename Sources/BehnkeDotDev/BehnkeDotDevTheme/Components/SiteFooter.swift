//
//  SiteFooter.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct SiteFooter<Site: Website>: Component {
  var context: PublishingContext<Site>
  var body: Component {
    Footer {
      Paragraph {
        Text("Generated Using ")
        Link("Publish", url: "https://github.com/johnsundell/publish")
      }
      Paragraph {
        Link("RRS Feed", url: "/feed.rss")
      }
    }
    .style("text-align: center;")
  }
}
