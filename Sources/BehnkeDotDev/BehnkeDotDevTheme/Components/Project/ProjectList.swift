//
//  ProjectList.swift
//  
//
//  Created by John Behnke on 5/12/21.
//

import Foundation
import Plot
import Publish

struct ProjectList<Site: Website>: Component {
  var context: PublishingContext<Site>
  var items: [Item<BehnkeDotDev>]
  var title: String
  
  var sillyStuff: [Item<BehnkeDotDev>]
  var apps: [Item<BehnkeDotDev>]
  var smallStuff: [Item<BehnkeDotDev>]
  
  init(context: PublishingContext<Site>, items: [Item<BehnkeDotDev>], title: String) {
    self.context = context
    self.items = items
    self.title = title
    
    let sortedItems = items.sorted(by: { ($0.metadata.clickable ?? false) && !($1.metadata.clickable ?? false)})
    self.sillyStuff = sortedItems.filter { $0.metadata.scale == "silly" }
    self.apps = sortedItems.filter { $0.metadata.scale == "app" }
    self.smallStuff = sortedItems.filter { $0.metadata.scale == "small" }
    
  }
  
  var body: Component {
    Div {
      if apps.count > 0 { H1("Some stuff I've built")
          .class("content-list-head")
        for item in apps {
          ProjectPreview(context: context, item: item)
        }
      }
      if smallStuff.count > 0 { H1("Small stuff I'm working on")
          .class("content-list-head")
        for item in smallStuff {
          ProjectPreview(context: context, item: item)
        }
      }
      if sillyStuff.count > 0 { H1("Silly stuff (for the laughs)")
          .class("content-list-head")
        for item in sillyStuff {
          ProjectPreview(context: context, item: item)
        }
      }
    }.class("preview-list")
  }
}


