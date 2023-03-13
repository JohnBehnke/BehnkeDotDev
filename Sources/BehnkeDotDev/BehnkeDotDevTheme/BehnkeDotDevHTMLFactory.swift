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

    let aboutPage = context.pages["about"]
    return HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .body{
        SiteHeader(context: context)
        AboutPage(context: context, page: aboutPage!)
        SiteFooter(context: context)
      }
    )
  }
  
  func makeSectionHTML(for section: Section<BehnkeDotDev>,
                       context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: section, on: context.site),
      .body {
        SiteHeader(context: context)
        SiteSection(context: context, section: section)
        SiteFooter(context: context)
      }
    )
  }
  
  func makeItemHTML(for item: Item<BehnkeDotDev>,
                    context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: item, on: context.site),
      .body {
        SiteHeader(context: context)
        Div{
          Div {
            H2(item.title)
              .class("post__title")
//            Paragraph(DateFormatter.shortDate.string(from: item.date))
//              .class("post__date")
//            TagList(context: context, item: item, center: true)
            Div(item.content.body)
              .class("post__text")
          }.class("main-text item-page")
        }.id("")
        SiteFooter(context: context)
      }
      
    )
  }
  
  func makePageHTML(for page: Page,
                    context: PublishingContext<BehnkeDotDev>) throws -> HTML {
    
    var pageToRender:Component
    switch page.path {
    case "about":
      pageToRender = AboutPage(context: context, page: page)
    default:
      pageToRender = AboutPage(context: context, page: page)
    }
    
    return HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body {
        SiteHeader(context: context)
        pageToRender
        SiteFooter(context: context)
      }
    )
  }
  
  func makeTagListHTML(for page: TagListPage,
                       context: PublishingContext<BehnkeDotDev>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body {
        SiteHeader(context: context)
        H1("Browse all Tags")
          .class("all-tags")
        for tag in page.tags.sorted() {
          Link(tag.string.capitalized, url: context.site.path(for: tag).absoluteString)
            .class("tag \(tag.string.lowercased())")
        }

        SiteFooter(context: context)
      }
    )
  }
  
  func makeTagDetailsHTML(for page: TagDetailsPage,
                          context: PublishingContext<BehnkeDotDev>) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
//      .body(
//        .header(for: context.site),
//        .component(SiteHeader(context: context)),
//        .group(
//          .h1(
//            "Tagged with ",
//            .span(.class("tag \(page.tag.string.lowercased())"), .text(page.tag.string.capitalized))
//          ),
//          .a(
//            .class("browse-all"),
//            .text("Browse all tags"),
//            .href(context.site.tagListPath)
//          ),
//          .itemList(
//            for: context.items(
//              taggedWith: page.tag,
//              sortedBy: \.date,
//              order: .descending
//            ),
//            on: context.site,
//            section: BehnkeDotDev.SectionID.posts,
//            title: ""
//          )
//        ),
//        .footer(for: context.site)
//      )
      .body {
        SiteHeader(context: context)
        H1(ComponentGroup(members: [
          Text("Tagged with "),
          Span(page.tag.string.capitalized).class("tag \(page.tag.string.lowercased())")
        ]))
        Link("Browse all tags", url: context.site.tagListPath.absoluteString)
        ItemList(context: context, items: context.items(taggedWith: page.tag, sortedBy: \.date, order: .descending), section: BehnkeDotDev.SectionID.posts, title: "")
        SiteFooter(context: context)
      }
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
