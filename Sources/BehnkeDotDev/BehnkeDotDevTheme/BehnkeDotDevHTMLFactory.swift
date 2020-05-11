//
//  BehnkeDotDevHTMLFactory.swift
//  
//
//  Created by John Behnke on 5/3/20.
//

import Publish
import Plot

struct BehnkeDotDevHTMLFactory: HTMLFactory {

  func makeIndexHTML(for index: Index,
                     context: PublishingContext<BehnkeDotDev>) throws -> HTML {

    let allItems =  context.allItems(sortedBy: \.date, order: .descending)
    let allBlogPosts = allItems.filter({ (item: Item) -> Bool in
      item.sectionID == .posts
    })
    let allAstrophotographyPosts = allItems.filter({ (item: Item) -> Bool in
      item.sectionID == .astrophotography
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
        .sidebar(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text"),
            .itemList(for: Array(allBlogPosts[0..<(allBlogPosts.count > 2 ? 3 : allBlogPosts.count)]), on: context.site, title: "Recent Blog Posts"),
            .itemList(for: Array(allAstrophotographyPosts[0..<(allAstrophotographyPosts.count > 2 ? 3 : allAstrophotographyPosts.count)]), on: context.site, title: "Recent Astrophotogrphy Photos")
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
        .sidebar(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text"),
            .itemList(for: section.items, on: context.site, title: section.title)

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
        .sidebar(for: context.site),
        .div(
          .id("content"),
          .div(
            .class("main-text item-page"),
            .contentBody(item.body)
          )
        )


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
        .text("daskjdhakjdhjkdhasjkdhakjdhs"),
        .sidebar(for: context.site),
        .wrapper(.contentBody(page.body)),
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
        .header(for: context, selectedSection: nil),
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
        .header(for: context, selectedSection: nil),
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


  

  static func header<T: Website>(
    for context: PublishingContext<T>,
    selectedSection: T.SectionID?
  ) -> Node {
    let sectionIDs = T.SectionID.allCases

    return .header(
      .wrapper(
        .a(.class("site-name"), .href("/"), .text(context.site.name)),
        .if(sectionIDs.count > 1,
            .nav(
              .ul(.forEach(sectionIDs) { section in
                .li(.a(
                  .class(section == selectedSection ? "selected" : ""),
                  .href(context.sections[section].path),
                  .text(context.sections[section].title)
                  ))
                })
          )
        )
      )
    )
  }

  static func itemList(for items: [Item<BehnkeDotDev>], on site: BehnkeDotDev, title: String) -> Node {
    return

      .div(
        .h2(
          .text(title)
        ),
        .ul(
          .class("item-list"),
          .forEach(items) { item in
            .li(
              postPreview(for: item, on: site)
            )
          }
        )
    )

  }

  static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
    return .ul(.class("tag-list"), .forEach(item.tags) { tag in
      .li(.a(
        .href(site.path(for: tag)),
        .text(tag.string)
        ))
      })
  }

  
}
