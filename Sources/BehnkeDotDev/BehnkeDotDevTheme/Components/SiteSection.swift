//
//  SiteSection.swift
//  
//
//  Created by John Behnke on 5/15/21.
//

import Foundation
import Publish
import Plot

struct SiteSection<Site: Website>: Component {
  var context: PublishingContext<Site>
  var section: Section<BehnkeDotDev>
  var body: Component {
    Div {
      Div {
        ItemList(context: context, items: section.items, section: section.id, title: section.title, layout: section.id.rawValue == "gallery" ? .masonry : .flex)
      }.class("main-text")
    }.id("content")
  }
}
