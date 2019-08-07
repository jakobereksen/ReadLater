//
//  Article.swift
//  ReadLater
//
//  Created by Jakob Sen on 03.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

struct Article: Identifiable, Codable {
    var id: String { return source }
    var title: String
    var paper: String
    var source: String
    var isDone: Bool
}
