---
title: Hello World!
date: 2020-05-02 19:56
description: Creating a website in Swift via Publish.
---

Ever since I built this website back in November 2016, it has been a single HTML page with inline CSS. Why so simple? While I can do front-end development, I wouldn't call myself a front-end developer. I've always gravitated towards dealing with data in the back-end over flexing boxes and slinging divs. So when it came time to build out a personal portfolio/resume site, I grabbed some of the css from the wonderful [bettermotherfuckingwebsite](http://bettermotherfuckingwebsite.com), tweaked it a bit, slapped by face on it, got roasted by buddy for using body tags like divs, and called it a day. From 2016 until about the middle of last year, that's how it stayed, save for I think two redesigns and some content updates.
    
    
    ![](/images/posts/2023/03/12/old_site_1.jpg)
    * The oldest version the site, complete with mid 2010's "card" styling *
    
    ![](/images/posts/2023/03/12/old_site_2.jpg)
    * In 2017, I added particles.js along with a border to the profile picture that would randomly select from some colors *
    
    ![](/images/posts/2023/03/12/old_site_3.jpg)
    * In April of 2020, a month into COVID-19 lock downs, I ripped out most of the site and made it a lot simpler. *
    

While I don't like doing front-end work *on the web*, I actually don't mind doing it for Apple's platforms, especically since SwiftUI came out in 2019. I don't know *why* exactly, but at least part of the issue is that I don't like HTML+CSS. Ideally, I'd be able to write my personal site in some Swift-related stack. For a little bit I toyed around with the idea creating my own static site generator. 

Thankfully I didn't have to.

Around the end of December in 2019, John Sundell, a prolific Swift developer and podcaster released his open source static site generator written in Swift, called <a href="https://github.com/johnsundell/publish" target="_blank">Publish</a>. Having heard him talk about creating Publish on the podcasts he hosts, I was extremely interested in giving it a shot. In May of 2020, a few months into the crazy world of COVID-19, I decided to dive in.


My <a href="https://www.youtube.com/watch?v=NOPIobI_0B8" target="_blank">main goal</a> was to move the site from a single page "billboard" of a site into something larger, with an area for me to blog, an area to show off stuff I've been working on, and a gallary of my growing collection of astrophotography images. This isn't anything ground breaking, so I was hoping it would take a few weekends to knock out. Obviously this didn't work out, given its 2023 and I'm only now just publishing this new version. What gives?

It turns out, trying to redesign your site without any kind of mock-up or idea of what I wanted it to look like was a bad decision. Couple this with my general disinterest in front-end *AND* the lack of resources around the initial version of Publish, <a href="https://youtu.be/Qp1oN23xotM?t=5" target="blank">I was straight up not having a good time</a>. Starting to feel burnt out on it, I shelved the redesign for about a year.

In May of 2021, <a href="https://www.swiftbysundell.com/articles/introducing-plot-components/" target="_blank"> John Sundell released a new version of Plot</a> (the library Publish uses for converting Swift to HTML) that totally reinvigorated my drive for this redesign. Working with it's new component-based API felt way more natural to me, having been toying around with SwiftUI the past year. Instead of fighting both the tooling and the design, I was now only fighting the design. So for the next two-ish years, I slowly picked away at the resign. I settled on the current layout pretty quickly, so my effort mostly went into getting bare bones implementation to look good. 

And well, here I am now. Its *mostly* where I want it to be (I think). So what am I going to do here? I think I want to aim for a blog post a month. What about exactly? I don't really know. Maybe it'll be some long stream of conscience about the rumored upcoming Apple XR headset, or a rant about some small bug in some tool I'm working with driving me crazy. Maybe I'll write about a solution I found to some obscure problem in the hopes my dinky little blog can help someone else out. Who knows.

Anyways, thanks for reading. If you want to follow along my ramblings, there's a RSS link in the footer of the site you can use to follow to this blog your favorite RSS reader (because we stan RSS in the house and you should have a favorite RSS reader).
