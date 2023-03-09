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
  var title: String
  var body: Component {    
    Div {
      H1(title)
        .class("content-list-head")
      for item in items {
        ProjectPreview(context: context, item: item)
      }
    }.class("preview-list")
  }
}


