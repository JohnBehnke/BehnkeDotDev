//
//  File.swift
//  
//
//  Created by John Behnke on 5/9/20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func tagList(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev) -> Node {
    .ul(.class("tag-list"), .forEach(item.tags) { tag in
      .li(.a(
        .href(site.path(for: tag)),
        .text(tag.string)
        ))
      })
  }
}
