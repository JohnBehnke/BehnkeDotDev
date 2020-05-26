//
//  Node+About.swift
//  
//
//  Created by John Behnke on 5/24/20.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
  static func about(for site: BehnkeDotDev, page: Page) -> Node {
    return
      .div(
        .div(
          .class("greeting"),
          .h1(
            .class("greeting__text"),
            .text("Hey, I'm John")
          ),
          .img(
            .class("waving-hand hidden-on-smaller"),
            .src("/images/waving-hand.png")
          )
          ),
          .div(
            .class("profile"),
            .img(
              .class("profile__image"),
              .src("/images/profile.jpg")
            )
        ),
          .div(
            .class("main-text"),
            .contentBody(page.body)
          )
    )
  }
}
