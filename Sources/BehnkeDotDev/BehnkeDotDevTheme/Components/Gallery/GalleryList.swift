//
//  GalleryList.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct GalleryList<Site: Website>: Component {
  var context: PublishingContext<Site>
  var items: [Item<BehnkeDotDev>]
  var layout: BehnkeDotDev.Layout
  var title: String
  var body: Component {
    ComponentGroup(members: [
      Div {
        H1(title).class("content-list-head")
      }.class("preview-list"),
      Div {
        for item in items {
          GalleryPreview(context: context, item: item, layout: layout)
        }
      }.class(layout == .masonry ? "masonry" : "row recent-gallery")
    ])
  }
}


