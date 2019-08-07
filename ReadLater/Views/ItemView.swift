//
//  SwiftUIView.swift
//  ReadLater
//
//  Created by Jakob Sen on 03.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

import SwiftUI
import Foundation

struct ItemView: View {
    var article: Article
    var onCheckBoxPress: ((Bool) -> Void)?
    
    private var isDone: Bool {
        get {
            return appState.articleData[appState.articleData.firstIndex(where: { (article) -> Bool in
            article.source == self.article.source
            }) ?? 0].isDone
        }
    }
    @EnvironmentObject var appState: AppState
    
    private func handleCheckBoxPress(newIsDone: Bool) {
        if let onCheckBoxPress = self.onCheckBoxPress {
            onCheckBoxPress(newIsDone)
        }
        
        let index = self.appState.articleData.firstIndex { (innerArticle) -> Bool in
            innerArticle.source == article.source
        }
            if let index = index {
                self.appState.articleData[index].isDone = newIsDone
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            VStack(alignment: .leading) {
                Text(article.title).font(.system(size: 20)).bold().strikethrough(self.isDone, color: Color.gray).foregroundColor(self.isDone ? Color.gray : Color.black)
                Text(article.paper).font(.system(size: 16)).fontWeight(.light).strikethrough(self.isDone, color: Color.gray).foregroundColor(self.isDone ? Color.gray : Color.black)
            }
            Spacer()
            CheckBoxView(isDone: self.isDone, onPress: handleCheckBoxPress)
            })
    }
}

#if DEBUG
struct SwiftUIView_Previews: PreviewProvider {
    
    static let testArticle = Article(title: "some title", paper: "some paper", source: "some source", isDone: false)
    
    static var previews: some View {
        ItemView(article: testArticle)
    }
}
#endif
