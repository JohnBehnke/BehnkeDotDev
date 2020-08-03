import Foundation
import Publish
import Plot
import ShellOut
import S3PublishDeploy


extension Plugin {
  static var ensureAllItemsAreTagged: Self {
    Plugin(name: "Ensure that all items are tagged") { context in
      let allItems = context.sections.flatMap { $0.items }

      for item in allItems {
        guard !item.tags.isEmpty else {
          throw PublishingError(
            path: item.path,
            infoMessage: "Item has no tags"
          )
        }
      }
    }
  }
}

// This will generate your website using the built-in Foundation theme:

try BehnkeDotDev().publish(using: [
  .copyResources(),
  .addMarkdownFiles(),
  .installPlugin(.ensureAllItemsAreTagged),
  .addPage(Page(path: "404", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .addPage(Page(path: "cage-page", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .generateHTML(withTheme: .behnkeDotDev),
//  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases)),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.posts]), config: RSSFeedConfiguration(targetPath: "post.rss")),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.gallery]), config: RSSFeedConfiguration(targetPath: "astro.rss")),
  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases), config: RSSFeedConfiguration(targetPath: "all.rss")),
  .generateSiteMap()
])
