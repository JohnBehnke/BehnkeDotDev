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

  static func galleryPreview(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev) -> Node {
let fun = "console.log('hello world')"
    return
    //    .section(
    //      .header(
    //        .h2(
    //          .class("post__title--preview"),
    //          a(
    //            .class("post__link"),
    //            .href(item.path),
    //            .text(item.title)
    //          )
    //        )
    //      ),
    //      .p(
    //        .class("post__date--preview"),
    //        .text(DateFormatter.shortDate.string(from: item.date))
    //      ),
    //      .tagList(for: item, on: site),
    //      .p(
    //        .text(item.description)
    //      )
    //    )
    .div(
      .onclick(fun),
      .class("gallery_preview"),
      .style("width: 200px; height: 200px; padding: 25px;"),
      .img(
        .src(item.imagePath ?? "")

      ),
      .div(
        .class("galery_preview_description"),
        .h5(
          .style("text-align: center; margin-right: 10px;"),
          a(.href(item.path),
             .text(item.title)
          )
        ),
        .h5(.text(DateFormatter.shortDate.string(from: item.date)), style("text-align: center;"))
      )

    )

  }
}
