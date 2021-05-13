//
//  Node+Index.swift
//  
//
//  Created by John Behnke on 3/24/21.
//
import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  static func index(for site: BehnkeDotDev, items: [Item<BehnkeDotDev>]) -> Node {
    let allBlogPosts = items.filter{$0.sectionID == .posts}
    let allGalleryImages = items.filter{$0.sectionID == .gallery}
    return .group(
      .div(
        .id("content"),
        .div(
          .class("main-text"),
          
          .itemList(for: Array(allBlogPosts[0..<(allBlogPosts.count > 2 ? 3 : allBlogPosts.count)]),
                    on: site, section: BehnkeDotDev.SectionID.posts,
                    title: "Recent Posts"),
          .itemList(for: Array(allGalleryImages[0..<(allGalleryImages.count > 2 ? 3 : allGalleryImages.count)]),
                    on: site, section: BehnkeDotDev.SectionID.gallery,
                    title: "Recent Gallery Images")
        )
      )
    )
  }
}
