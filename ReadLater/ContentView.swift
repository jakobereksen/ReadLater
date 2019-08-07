//
//  ContentView.swift
//  ReadLater
//
//  Created by Jakob Sen on 02.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ArticleListView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
