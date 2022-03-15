//
//  404.swift
//  
//
//  Created by John Behnke on 1/12/22.
//

import Foundation
import Plot
import Publish

struct NotFound<Site: Website>: Component {
  var context: PublishingContext<Site>
  var body: Component {
      Div {
        SiteHeader(context: context)
        Paragraph("Not Found!")
      }
  }
  
}
