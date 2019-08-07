//
//  ArticleListView.swift
//  ReadLater
//
//  Created by Jakob Sen on 03.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

import SwiftUI

struct NoArticlesToReadView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "questionmark.circle").font(.system(size: 28))
            Text("No articles to read").font(.system(size: 28))
            Text("explanation text").font(.system(size: 18))
        }
    .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 450, maxHeight: .infinity, alignment: .center)
    }
}

struct ArticleListView: View {
    
    @State private var showDone = false {
        didSet {
            if(showDone) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    self.showDone = false
                }
            }
        }
    }
    
    @State private var showDoneToggle = false
    
    @EnvironmentObject var appState: AppState
    
    private func handleCheckBoxPress(_: Bool) {
        showDone = true
        print("showdone")
    }
    
    var body: some View {
        
        let hasNoArticlesToRead = appState.articleData.filter { (article) -> Bool in
              !article.isDone
          }.count == 0
        
        return NavigationView {
            List {
                if(hasNoArticlesToRead) {
                   NoArticlesToReadView()
                }
                ForEach(appState.articleData.filter({ (article) -> Bool in
                    !article.isDone
                })) {
                    article in ItemView(article: article, onCheckBoxPress: self.handleCheckBoxPress)
                }
                if(showDoneToggle || showDone) {
                    Spacer()
                    Text("Already Read").font(.system(size: 24)).bold().foregroundColor(.gray)
                    ForEach(appState.articleData.filter({ (article) -> Bool in
                        article.isDone
                    })) {
                        article in ItemView(article: article)
                    }
                }
            }
            .navigationBarTitle("To Read", displayMode: .large)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showDoneToggle = !self.showDoneToggle
                    if(self.showDone) {
                        self.showDone = false
                    }
                }) {
                    if(self.showDoneToggle || self.showDone) {
                        Image(systemName: "archivebox.fill")
                    } else {
                        Image(systemName: "archivebox")
                    }
                })
        }
    }
}

#if DEBUG
struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
#endif
