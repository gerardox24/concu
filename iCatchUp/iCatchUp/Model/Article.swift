//
//  Article.swift
//  iCatchUp
//
//  Created by Developer on 10/19/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Article: Codable {
    var source: Source
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

