//
//  AppState.swift
//  ReadLater
//
//  Created by Jakob Sen on 04.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    
    init(articleData: [Article]) {
        self.articleData = articleData
    }
    
    @Published var articleData: [Article] 
}
