//
//  PostPreview.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct PostPreview<Site: Website>: Component {
  var context: PublishingContext<Site>
  var item: Item<Site>
  var body: Component {
    Article {
      Header {
        H2 {
          Link(item.title, url: "\(item.path)")
            .class("post__link")
        }.class("post__title--preview")
      }
      Paragraph(DateFormatter.shortDate.string(from: item.date)).class("post__date--preview")
      TagList(context: context, item: item)
      Paragraph(item.description)
    }
  }
  
}

