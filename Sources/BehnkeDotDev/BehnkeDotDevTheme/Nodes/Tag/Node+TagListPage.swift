//
//  Node+TagListPage.swift
//  
//
//  Created by John Behnke on 4/21/21.
//

import Foundation
import Publish
import Plot
//
//extension Node where Context == HTML.BodyContext {
//  static func tagListPage(for site: BehnkeDotDev, page: TagListPage) -> Node {
//    return .group(
//        .h1("Browse all tags"),
//        .class("all-tags"),
//        .forEach(page.tags.sorted()) { tag in
//          .a(
//            .class("tag \(tag.string.lowercased())"),
//            .href(site.path(for: tag)),
//            .text(tag.string.capitalized)
//          )
//        }
//    )
//  }
//}
//
