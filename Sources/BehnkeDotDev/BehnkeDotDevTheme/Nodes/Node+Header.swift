//
//  Node+Header.swift
//  
//
//  Created by John Behnke on 5/17/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
  private static var sections: [BehnkeDotDev.SectionID] { BehnkeDotDev.SectionID.allCases  }

  static func header(for site: BehnkeDotDev) -> Node {
    return .div(
      .class("header"),
      .nav(
        .a(
          .class("nav__link"),
          .text("Home"),
          .href("/")
        ),
        .forEach(sections, { section in
          .group([
            .span(
              .style("font-weight: bold; color: blue;"),
              .text("•")
            ),
            .a(
              .class("nav__link"),
              .text(section.rawValue.capitalized),
              .href(site.path(for: section))
            )
          ])

        })
      )
    )
  }
}
