//
//  GalleryPreview.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct GalleryPreview<Site: Website>: Component {
  var context: PublishingContext<Site>
  var item: Item<Site>
  var layout: BehnkeDotDev.Layout
  var body: Component {
    Div(content: {
      ClickableImage
    }).class("gallery_preview_\(layout)")
  }
  private var ClickableImage: Component {
    
    var body: Component {
      Node.a(
        .href(item.path),
        .img(.src(item.imagePath ?? ""))
      )
    }
    return body
  }
}



