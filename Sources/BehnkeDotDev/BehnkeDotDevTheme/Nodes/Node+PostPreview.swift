//
//  Node+PostPreview.swift
//  
//
//  Created by John Behnke on 5/9/20.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func postPreview(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev) -> Node {
    .article(
      .div(
        .style("height: 150px; overflow: hidden;"),
        .img(.src("/images/ross.png"))
      ),
      .h1(
        a(
          .href(item.path),
          .text(item.title)
        ),
        .tagList(for: item, on: site),
        .p(
          .text(item.description)
        )
      )
    )
  }
}
