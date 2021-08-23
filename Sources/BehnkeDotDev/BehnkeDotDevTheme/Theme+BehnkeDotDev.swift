/**
 *  Publish
 *  Copyright (c) John Behnke 2020
 *  MIT license, see LICENSE file for details
 */


import Plot
import Publish
import Foundation


extension Theme where Site == BehnkeDotDev{
  static var behnkeDotDev: Self {
    Theme(htmlFactory: BehnkeDotDevHTMLFactory())
  }
}


