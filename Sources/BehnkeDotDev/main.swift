import Foundation
import Publish
import Plot
import ShellOut
import S3PublishDeploy


//extension PublishingStep where Site == BehnkeDotDev {
//  static func compileSass() -> Self {
//    .step(named: "Compiling sass into css") { context in
//
//      let currentDir = "/Users/john/Developer/Websites/Behnke\\ Dot\\ Dev"
//      try shellOut(to: "/usr/local/bin/sass", arguments: ["\(currentDir)/Resources/style.scss", "\(currentDir)/Resources/styles.css"])
//    }
//  }
//}


// This will generate your website using the built-in Foundation theme:

try BehnkeDotDev().publish(using: [
  .copyResources(),
  .addMarkdownFiles(),
  .addPage(Page(path: "404", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .addPage(Page(path: "cage-page", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .generateHTML(withTheme: .behnkeDotDev),
//  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases)),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.posts]), config: RSSFeedConfiguration(targetPath: "post.rss")),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.gallery]), config: RSSFeedConfiguration(targetPath: "astro.rss")),
  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases), config: RSSFeedConfiguration(targetPath: "all.rss")),
  .generateSiteMap()
])
