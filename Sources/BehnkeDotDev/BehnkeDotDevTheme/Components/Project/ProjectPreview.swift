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
  var body: Component {
    Div(content: {
      Div {
        H2 {
          Link(item.title, url: item.metadata.link ?? item.path.absoluteString)
        }.class("project__title--preview")
        Paragraph(item.description)
          .class("project__description--preview")
      }
    })
  }
}



