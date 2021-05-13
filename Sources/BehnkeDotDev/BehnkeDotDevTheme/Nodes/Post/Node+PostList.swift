//
//  Node+PostList.swift
//  
//
//  Created by John Behnke on 3/24/21.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  
  static func postList(for items: [Item<BehnkeDotDev>], on site: BehnkeDotDev, title: String) -> Node {
    return
      .div(
        .class("preview-list"),
        .h1(
          .class("content-list-head"),
          .text(title)
        ),
        .forEach(items) { item in
          postPreview(for: item, on: site)
        }
      )
  }
}
