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
  var items: [Item<BehnkeDotDev>]
  var section: BehnkeDotDev.SectionID
  var title: String
  var body: Component {
    if items.isEmpty { return EmptyComponent() }
    
    return PostList(context: context, items: items, title: title)
  }
  
}


