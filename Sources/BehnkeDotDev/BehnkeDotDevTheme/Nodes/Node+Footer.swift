//
//  Node+Footer.swift
//  
//
//  Created by John Behnke on 5/3/20.
//

import Foundation
import Plot

extension Node where Context == HTML.BodyContext {
  static func footer(for site: BehnkeDotDev) -> Node {
    let currentYear = Calendar.current.component(.year, from: Date())
    return .footer(
      .style("text-align: center;"),
      .p(
        .text("Generated using "),
        .a(
          .text("Publish"),
          .href("https://github.com/johnsundell/publish")
        )
      ),
      .p(.a(
        .text("RSS feed"),
        .href("/feed.rss")
        )
      ),
      .p(
        .text("© \(currentYear) \(site.name)")
      )
    )
  }
}
