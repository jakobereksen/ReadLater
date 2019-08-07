//
//  CheckBoxView.swift
//  ReadLater
//
//  Created by Jakob Sen on 03.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

import SwiftUI

struct CheckBoxView: View {
    @State private var scale: CGFloat = 1.0
    
    var isDone: Bool
    var onPress: ((Bool) -> Void)?
    
    private func handlePress() {
        if let onPress = self.onPress {
            onPress(!self.isDone)
        }
        print("checkboxpress with value: " + String(!self.isDone))
        let firstAnimation = Animation.easeInOut(duration: 0.2).delay(0.2)
        let secondAnimation = Animation.easeInOut(duration: 0.2)
        withAnimation(firstAnimation) {
            self.scale -= 0.1
        }
        withAnimation(secondAnimation) {
            self.scale = 1
        }
    }
    
    var body: some View {
        Rectangle()
            .frame(width: 30, height: 30, alignment: .trailing)
            .foregroundColor(isDone ? Color.blue : Color.clear)
            .border(isDone ? Color.clear : Color.gray, width: 3.5)
            .cornerRadius(7)
                .overlay(isDone ? Image(systemName: "checkmark").foregroundColor(Color.white) : nil)
            .scaleEffect(scale)
            .onTapGesture {
                self.handlePress()
            }
            .onLongPressGesture {
                self.handlePress()
            }
    }
}

#if DEBUG
struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckBoxView(isDone: false)
            CheckBoxView(isDone: true)
        }
    }
}
#endif
