//
//  BehnkeDotDevHTMLFactory.swift
//  
//
//  Created by John Behnke on 5/3/20.
//
import Foundation
import Publish
import Plot

struct BehnkeDotDevHTMLFactory: HTMLFactory {

  func makeIndexHTML(for index: Index,
                     context: PublishingContext<BehnkeDotDev>) throws -> HTML {

    let allItems =  context.allItems(sortedBy: \.date, order: .descending)
    let allBlogPosts = allItems.filter({ (item: Item) -> Bool in
      item.sectionID == .posts
    })
    let allGalleryImages = allItems.filter({ (item: Item) -> Bool in
      item.sectionID == .gallery
    })
    return HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .head(
        .script(
          .defer(),
          .src("https://use.fontawesome.com/releases/v5.0.6/js/all.js")
        )
      ),

      .body(
        //        .sidebar(for: context.site),
        .header(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text"),
            .itemList(for: Array(allBlogPosts[0..<(allBlogPosts.count > 2 ? 3 : allBlogPosts.count)]), on: context.site, section: BehnkeDotDev.SectionID.posts, title: "Recent Posts"),
            .itemList(for: Array(allGalleryImages[0..<(allGalleryImages.count > 2 ? 3 : allGalleryImages.count)]), on: context.site, section: BehnkeDotDev.SectionID.gallery ,title: "Recent Gallery Images")
          )
        ),
        .footer(for: context.site)
      )

    )
  }

  func makeSectionHTML(for section: Section<BehnkeDotDev>,
                       context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: section, on: context.site),
      .head(
        .script(
          .defer(),
          .src("https://use.fontawesome.com/releases/v5.0.6/js/all.js")
        )
      ),
      .body(
        //        .sidebar(for: context.site),
        .header(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text"),
            .itemList(for: section.items, on: context.site, section: section.id ,title: section.title)

          )
        ),
        .footer(for: context.site)
      )
    )
  }

  func makeItemHTML(for item: Item<BehnkeDotDev>,
                    context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: item, on: context.site),

      .body(
        //        .sidebar(for: context.site),
        .header(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text item-page"),
            .h2(
              .class("post__title"),
              .text(item.title)
            ),
            .p(
              .class("post__date"),
              .text( DateFormatter.shortDate.string(from: item.date))
            ),
            .tagList(for: item, on: context.site, center: true),
            .div(.class("post__text"), .contentBody(item.content.body))
          )
        ),
        .footer(for: context.site)
      )
    )
  }

  func makePageHTML(for page: Page,
                    context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .head(
        .script(
          .defer(),
          .src("https://use.fontawesome.com/releases/v5.0.6/js/all.js")
        )
      ),
      .body(
        .header(for: context.site),
        .if(page.path == "about", .about(for: context.site, page: page)),
        //        .sidebar(for: context.site),
        //        .wrapper(.contentBody(page.body)),
        .footer(for: context.site)
      )
    )
  }

  func makeTagListHTML(for page: TagListPage,
                       context: PublishingContext<BehnkeDotDev>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        //        .header(for: context, selectedSection: nil),
        .wrapper(
          .h1("Browse all tags"),
          .ul(
            .class("all-tags"),
            .forEach(page.tags.sorted()) { tag in
              .li(
                .class("tag"),
                .a(
                  .href(context.site.path(for: tag)),
                  .text(tag.string)
                )
              )
            }
          )
        ),
        .footer(for: context.site)
      )
    )
  }

  func makeTagDetailsHTML(for page: TagDetailsPage,
                          context: PublishingContext<BehnkeDotDev>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        //        .header(for: context, selectedSection: nil),
        .wrapper(
          .h1(
            "Tagged with ",
            .span(.class("tag"), .text(page.tag.string))
          ),
          .a(
            .class("browse-all"),
            .text("Browse all tags"),
            .href(context.site.tagListPath)
          ),
          .itemList(
            for: context.items(
              taggedWith: page.tag,
              sortedBy: \.date,
              order: .descending
            ),
            on: context.site,
            section: BehnkeDotDev.SectionID.posts,
            title: "test"
          )
        ),
        .footer(for: context.site)
      )
    )
  }
}

private extension Node where Context == HTML.BodyContext {
  
  static func wrapper(_ nodes: Node...) -> Node {
    .div(.class("wrapper"), .group(nodes))
  }

  static func itemList(for items: [Item<BehnkeDotDev>], on site: BehnkeDotDev, section: BehnkeDotDev.SectionID, title: String) -> Node {
    return
      .if(section == .posts,
          .div(
            .class("post-preview-list"),
            .h1(
              .class("content-list-head"),
              .text(title)
            ),
            .forEach(items) { item in
              postPreview(for: item, on: site)
            }
        ), else:
        .div(
          .h1(
            .class("content-list-head"),
            .text(title)
          ),
          .div(
            .class("gallery-preview-list"),
              .div(
                .class("row"),
                .forEach(items) { item in
                  galleryPreview(for: item, on: site)
                }
              )
          )
        )
    )

  }
}
public extension DateFormatter {
  static var shortDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()
}
