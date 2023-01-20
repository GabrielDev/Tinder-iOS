//
//  CardStack.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 19/01/23.
//

import SwiftUI

struct CardStack: View {
    
    var people: [Person]
    
    @State private var fullscreenMode: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullscreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        let people = MessagePreview.examples.map { $0.person }
        CardStack(people: people)
    }
}
