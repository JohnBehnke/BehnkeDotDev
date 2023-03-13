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
      Div {
        Node.a(.attribute(named: "rel", value: "me"), .img(.src("/images/mastodon.svg")),.href("https://mastodon.social/@johnbehnke"), .target(.blank))
        Node.a( .img(.src("/images/github.svg")),.href("https://github.com/JohnBehnke"),.target(.blank))
        Node.a( .img(.src("/images/linkedin.svg")),.href("https://www.linkedin.com/in/john-behnke-38b8b419b"),.target(.blank))
        
      }.class("socials")
      
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
      Paragraph {
        Link("RSS Feed", url: "/post.rss")
      }
    }
  }
}
