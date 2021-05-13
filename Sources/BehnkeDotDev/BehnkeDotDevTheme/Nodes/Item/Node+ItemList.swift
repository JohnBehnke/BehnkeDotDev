//
//  Node+ItemList.swift
//
//
//  Created by John Behnke on 3/24/21.
//
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
  
  static func itemList(for items: [Item<BehnkeDotDev>], on site: BehnkeDotDev, section: BehnkeDotDev.SectionID, title: String, layout: BehnkeDotDev.Layout = .flex) -> Node {
    
    if items.isEmpty { return .empty }
    return section == .posts
      ? postList(for: items, on: site, title: title)
      : galleryList(for: items, on: site, title: title, layout: layout)
  }
}
