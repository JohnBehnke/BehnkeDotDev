import Foundation
import Publish
import Plot
import ShellOut

try BehnkeDotDev().publish(using: [
  
  .copyResources(),
  .addMarkdownFiles(),
  .generateHTML(withTheme: .behnkeDotDev),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.posts]), config: RSSFeedConfiguration(targetPath: "post.rss")),
  .generateSiteMap(),
])
