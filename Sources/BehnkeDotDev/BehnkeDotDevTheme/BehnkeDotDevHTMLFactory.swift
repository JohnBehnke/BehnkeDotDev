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
    let aboutPage = context.pages["about"]
    return HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .body(
        .header(for: context.site),
        .if(allItems.count == 0,
            .about(for: context.site, page: aboutPage!),
            else: .index(for: context.site, items: allItems)
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
      .body(
        .header(for: context.site),
        .section(for: context.site, section: section),
        .footer(for: context.site)
      )
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
            Paragraph(DateFormatter.shortDate.string(from: item.date))
              .class("post__date")
            TagList(context: context, item: item, center: true)
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
    var nodeToRender:Node<HTML.BodyContext>
    switch page.path {
    case "about":
      nodeToRender = Node.about(for: context.site, page: page)
    default:
      nodeToRender = Node.about(for: context.site, page: page)
    }
    
    return HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site),
      .body(
        .header(for: context.site),
        nodeToRender,
        .footer(for: context.site)
      )
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
          Link(tag.string.capitalized, url: "\(context.site.path(for: tag))")
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
      .body(
//        .header(for: context.site),
        .component(SiteHeader(context: context)),
        .group(
          .h1(
            "Tagged with ",
            .span(.class("tag \(page.tag.string.lowercased())"), .text(page.tag.string.capitalized))
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
            title: ""
          )
        ),
        .footer(for: context.site)
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
