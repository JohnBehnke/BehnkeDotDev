//
//  Node+Item.swift
//  
//
//  Created by John Behnke on 4/21/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func item(for site: BehnkeDotDev, item: Item<BehnkeDotDev>) -> Node {
    return .group(
      .div(
        .id("content"),
        .div(
          .class("main-text item-page"),
          .h2(
            .class("post__title"),
            .text(item.title)
          ),
          .p(
            .class("post__date"),
            .text( DateFormatter.shortDate.string(from: item.date))
          ),
          .tagList(for: item, on: site, center: true),
          .div(.class("post__text"), .contentBody(item.content.body))
        )
      )
    )
  }
}

