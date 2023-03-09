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
  let currentYear = Calendar.current.component(.year, from: Date())
  var body: Component {
    Footer {
      Paragraph {
        Text("Written in 100% Swift")
      }
      Paragraph {
        Text("Generated Using ")
        Link("Publish", url: "https://github.com/johnsundell/publish")
      }
      Paragraph {
        Text("Copyright © \(currentYear) John Behnke")
      }
//    Paragraph {
//      Link("RRS Feed", url: "/feed.rss")
//    }
    }
  }
}
