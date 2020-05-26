//
//  Node+PostPreview.swift
//  
//
//  Created by John Behnke on 5/9/20.
//
import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func postPreview(for item: Item<BehnkeDotDev>, on site: BehnkeDotDev) -> Node {
    .section(
      .header(
        .h2(
          .class("post__title--preview"),
          a(
            .class("post__link"),
            .href(item.path),
            .text(item.title)
          )
        )
      ),
      .p(
        .class("post__date--preview"),
        .text(DateFormatter.shortDate.string(from: item.date))
      ),
      .tagList(for: item, on: site),
      .p(
        .text(item.description)
      )
    )
  }
}
