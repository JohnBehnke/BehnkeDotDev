//
//  ProjectPreview.swift
//  
//
//  Created by John Behnke on 1/22/22.
//

import Foundation
import Plot
import Publish

struct ProjectPreview<Site: Website>: Component {
  var context: PublishingContext<Site>
  var item: Item<BehnkeDotDev>
  var layout: BehnkeDotDev.Layout
  var body: Component {
    Div(content: {
      Div {
        H3 {
          Link(item.title, url: item.metadata.link ?? item.path.absoluteString)
        }.class("post__title--preview")
        Paragraph(item.description).class("gallery_preview__date--preview")
      }NJ.class("gallery_preview_description")
    })
  }
}



