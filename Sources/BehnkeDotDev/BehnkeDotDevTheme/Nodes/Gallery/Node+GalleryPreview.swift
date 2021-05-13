//
//  Node+GalleryPreview.swift
//
//
//  Created by John Behnke on 6/16/20.
//
import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {

  static func galleryPreview(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev, layout: BehnkeDotDev.Layout) -> Node {
    .div(
      .if(layout == .masonry,  .class("gallery_preview_masonry"), else:  .class("gallery_preview_flex")),
      .a(
        .href(item.path),
        .img(
          .src(item.imagePath ?? "")
        )
      ),
      .div(
        .class("gallery_preview_description"),
        .h3(
          .style("text-align: center; margin-right: 10px;"),
          a(.href(item.path),
             .text(item.title)
          )
        ),
        .p(
          .class("gallery_preview__date--preview"),
          .text(DateFormatter.shortDate.string(from: item.date))
        ),
        .tagList(for: item, on: site)
      )

    )

  }
}
