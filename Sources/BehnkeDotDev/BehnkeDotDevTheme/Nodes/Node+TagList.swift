//
//  File.swift
//  
//
//  Created by John Behnke on 5/9/20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func tagList(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev, center: Bool = false) -> Node {

    .div(
      .if(center, .class("tag-list--centered")),
      .forEach(item.tags) { tag in
        .a(
          .class("tag"),
          .href(site.path(for: tag)),
          .text(tag.string)
        )
      }
    )

  }
}
