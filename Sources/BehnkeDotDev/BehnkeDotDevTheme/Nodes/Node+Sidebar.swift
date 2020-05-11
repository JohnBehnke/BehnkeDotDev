//
//  Node+Sidebar.swift
//  
//
//  Created by John Behnke on 5/3/20.
//

import Foundation
import Plot

extension Node where Context == HTML.BodyContext {
  static func sidebar(for site: BehnkeDotDev) -> Node {
    let sections: [BehnkeDotDev.SectionID] = BehnkeDotDev.SectionID.allCases

    return
      .div(
        .id("sidebar"),
        .class("hidden-on-small"),
        .img(
          .id("profile"),
          .class("profile__image"),
          .src("/images/profile.jpg")
        ),
        .h2(
          .b(
            .text("John Liam Behnke")
          )
        ),
        .p(
          .text("Software Engineer")
        ),
        .forEach(sections, { section in
          .div(
            .a(
              .text(section.rawValue.capitalized),
              .href(site.path(for: section))
            )
          )

        }),
        .div(
          .class("contact"),
          .a(
            .href("/files/JohnBehnkeResume.pdf"),
            .target(
              .blank
            ),
            .i(
              .class("far fa-file-alt fa-lg")
            )
          ),
          .a(
            .href("mailto:john@behnke.xyz"),
            .class("link"),
            .target(
              .blank
            ),
            .i(
              .class("far fa-envelope fa-lg")
            )
          ),
          .a(
            .href("http://www.github.com/johnbehnkef"),
            .target(
              .blank
            ),
            .i(
              .class("fab fa-github-alt fa-lg")
            )
          )
        )
    )
  }
}
