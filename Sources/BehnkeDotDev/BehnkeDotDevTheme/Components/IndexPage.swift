//
//  IndexPage.swift
//  
//
//  Created by John Behnke on 5/15/21.
//

import Foundation
import Plot
import Publish

struct IndexPage<Site: Website>: Component {
  var context: PublishingContext<Site>
  var items: [Item<BehnkeDotDev>]
  
  var body: Component {
    let allBlogPosts = items.filter{$0.sectionID == .posts}
    let allGalleryImages = items.filter{$0.sectionID == .gallery}
    return Div {
      Div {
        ItemList(context: context, items: Array(allBlogPosts[0..<(allBlogPosts.count > 2 ? 3 : allBlogPosts.count)]), section: BehnkeDotDev.SectionID.posts, title: "Recent Posts")
        ItemList(context: context, items: Array(allGalleryImages[0..<(allGalleryImages.count > 2 ? 3 : allGalleryImages.count)]), section: BehnkeDotDev.SectionID.gallery, title: "Recent Gallery Images")
      }.class("main-text")
    }.id("content")
  }
  
}
