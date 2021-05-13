//
//  Node+Section.swift
//  
//
//  Created by John Behnke on 4/21/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func section(for site: BehnkeDotDev, section: Section<BehnkeDotDev>) -> Node {
    return .group(
      
      .div(
        .id("content"),
        .div(
          .class("main-text"),
          .itemList(for: section.items, on: site, section: section.id ,title: section.title, layout: section.id.rawValue == "gallery" ? .masonry : .flex)
        )
      )
    )
  }
}
