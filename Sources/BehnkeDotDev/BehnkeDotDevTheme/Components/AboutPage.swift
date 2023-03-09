//
//  AboutPage.swift
//  
//
//  Created by John Behnke on 5/15/21.
//

import Foundation
import Plot
import Publish

struct AboutPage<Site: Website>: Component {
  var context: PublishingContext<Site>
  var page: Page
  var body: Component {
    Div {
      Div {
        H1("Hey, I'm John")
          .class("greeting__text")
        Image("/images/waving-hand.png")
          .class("waving-hand hidden-on-small")
      }.class("greeting")
      Div {
        Image("/images/profile.jpg")
          .class("profile__image")
      }.class("profile")
      Div(page.body)
        .class("main-text")
    }
  }
  
}
