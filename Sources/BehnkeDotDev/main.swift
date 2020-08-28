import Foundation
import Publish
import Plot
import ShellOut
import S3PublishDeploy

let validBlogPostTags = Set(arrayLiteral: Tag("astrophotography"), Tag("tutorial"), Tag("development"))
let validGalleryTags = Set(arrayLiteral: Tag("astrophotography"), Tag("tutorial"), Tag("development"))

extension Plugin {
  static var checkBlogPostForValidTags: Self {
    Plugin(name: "Check if all blog posts have valid tags") { context in
      let sectionID: Site.SectionID = BehnkeDotDev.SectionID.posts as! Site.SectionID
      let blogPosts = context.sections[sectionID].items
      for post in blogPosts {
        guard !post.tags.isEmpty else {
          throw PublishingError(
            path: post.path,
            infoMessage: "Blog post has no tags"
          )
        }
        guard Set(post.tags).isSubset(of: validBlogPostTags) else {
          throw PublishingError(
            path: post.path,
            infoMessage: "Blog post has invalid tag(s)"
          )
        }
      }
    }
  }
}

extension Plugin {
  static var checkGalleryPostForValidTags: Self {
    Plugin(name: "Check if all gallery posts have valid tags") { context in
      let sectionID: Site.SectionID = BehnkeDotDev.SectionID.posts as! Site.SectionID
      let blogPosts = context.sections[sectionID].items
      for post in blogPosts {
        guard !post.tags.isEmpty else {
          throw PublishingError(
            path: post.path,
            infoMessage: "Gallery post has no tags"
          )
        }
        guard Set(post.tags).isSubset(of: validGalleryTags) else {
          throw PublishingError(
            path: post.path,
            infoMessage: "Gallery post has invalid tag(s)"
          )
        }
      }
    }
  }
}

extension Plugin {
  static var ensureAllITagsAreLowercase: Self {
    Plugin(name: "Ensure that all tags are lowercase") { context in
      let allItems = context.sections.flatMap { $0.items }
      
      for item in allItems {
        for tag in item.tags {
          if tag.string.lowercased() != tag.string {
            throw PublishingError(
              path: item.path,
              infoMessage: "Item has no tags"
            )
          }
        }
      }
    }
  }
}

// This will generate your website using the built-in Foundation theme:

try BehnkeDotDev().publish(using: [
  .copyResources(),
  .addMarkdownFiles(),
  .installPlugin(.checkBlogPostForValidTags),
  .installPlugin(.checkGalleryPostForValidTags),
  .installPlugin(.ensureAllITagsAreLowercase),
  .addPage(Page(path: "404", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .addPage(Page(path: "cage-page", content: Content(title: "404 Not Found", description: "404", body: Content.Body(html: "hello")))),
  .generateHTML(withTheme: .behnkeDotDev),
  //  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases)),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.posts]), config: RSSFeedConfiguration(targetPath: "post.rss")),
  .generateRSSFeed(including: Set([BehnkeDotDev.SectionID.gallery]), config: RSSFeedConfiguration(targetPath: "astro.rss")),
  .generateRSSFeed(including: Set(BehnkeDotDev.SectionID.allCases), config: RSSFeedConfiguration(targetPath: "all.rss")),
  .generateSiteMap()
])
