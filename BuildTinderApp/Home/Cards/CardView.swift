//
//  CardView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 19/01/23.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var userState: UserManager
    
    @State var person: Person
    
    @Binding var fullscreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    
    @Namespace var imageNamespace
    
    var body: some View {
        GeometryReader { geo in
            if fullscreenMode {
                FullscreenCardView(
                    person: person,
                    fullscreenMode: $fullscreenMode,
                    nameSpace: imageNamespace
                )
                
            } else {
                CardImageScroller(person: person, fullscreenMode: $fullscreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .padding(.leading, 10)
                    .matchedGeometryEffect(id: "image\(person.id)", in: imageNamespace)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.default) {
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    
                                    withAnimation {
                                        person.degree = Double((value.translation.width / 25) * -1)
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(
                                    mass: 1.0,
                                    stiffness:50,
                                    damping: 10,
                                    initialVelocity: 0
                                )) {
                                    let width = value.translation.width
                                    
                                    if abs(width) >= 0 && abs(width) <= screenCutoff {
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    } else if width > screenCutoff {
                                        person.x = 500
                                        person.degree = 12
                                        userState.swipe(person, .no)
                                    } else if width < -screenCutoff {
                                        person.x = -500
                                        person.degree = -12
                                        userState.swipe(person, .like)
                                    }
                                }
                            })
                    )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullscreenMode: .constant(false))
            .environmentObject(UserManager())
        
        CardView(person: Person.example, fullscreenMode: .constant(true))
            .environmentObject(UserManager())
    }
}
