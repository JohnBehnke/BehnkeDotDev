//
//  TagList.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct TagList<Site: Website>: Component {
  var context: PublishingContext<Site>
  var item: Item<BehnkeDotDev>
  var center: Bool = false
  var body: Component {
    Div(content: {
      for tag in item.tags {
        Link(tag.string.capitalized, url: context.site.path(for: tag).absoluteString)
          .class("tag \(tag.string.lowercased())")
      }
    }).class(center ? "tag-list--centered" : "")
  }
}

