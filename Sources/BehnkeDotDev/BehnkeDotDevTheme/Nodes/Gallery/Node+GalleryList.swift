//
//  Node+GalleryList.swift
//  
//
//  Created by John Behnke on 3/24/21.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  
  static func galleryList(for items: [Item<BehnkeDotDev>], on site: BehnkeDotDev, title: String, layout: BehnkeDotDev.Layout) -> Node {
    return
      .div(
        .class("preview-list"),
        .h1(
          .class("content-list-head"),
          .text(title)
        ),
        .div(
          .if(layout == .masonry, .class("masonry"), else: .class("row")),
          .forEach(items) { item in
            galleryPreview(for: item, on: site, layout: layout)
          }
        )
      )
  }
}

