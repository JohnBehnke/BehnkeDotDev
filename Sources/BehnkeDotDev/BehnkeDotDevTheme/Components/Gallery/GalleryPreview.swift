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
  var item: Item<BehnkeDotDev>
  var layout: BehnkeDotDev.Layout
  var body: Component {
    Div(content: {
      ClickableImage
      Div {
        H3 {
          Link(item.title, url: item.path.absoluteString)
        }.style("text-align: center; margin-right: 10px;")
        Paragraph(DateFormatter.shortDate.string(from: item.date)).class("gallery_preview__date--preview")
        TagList(context: context, item: item)
      } .class("gallery_preview_description")
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



