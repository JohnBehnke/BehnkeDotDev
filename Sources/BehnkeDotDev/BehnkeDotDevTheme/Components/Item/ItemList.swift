//
//  ItemList.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct ItemList<Site: Website>: Component {
  var context: PublishingContext<Site>
  var items: [Item<Site>]
  var section: BehnkeDotDev.SectionID
  var title: String
  var laypout: BehnkeDotDev.Layout = .flex
  var body: Component {
    if items.isEmpty { return EmptyComponent() }
    return section == .gallery
    ? GalleryList(context: context, items: items, layout: laypout, title: title)
      : PostList(context: context, items: items, title: title)
  }
  
}


