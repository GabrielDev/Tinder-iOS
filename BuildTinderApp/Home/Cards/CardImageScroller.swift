//
//  CardImageScroller.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 19/01/23.
//

import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    
    var person: Person
    
    @State private var imageIndex = 0
    
    @Binding var fullscreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    
    func updateImageIndex(addition: Bool) {
        let newIndex = addition ? imageIndex + 1 : imageIndex - 1
               
        imageIndex = min(max(0, newIndex), person.imagesURL.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imagesURL[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Image("likeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCutoff) - 1)
                            
                            Spacer()
                            
                            Image("nopeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(person.x / screenCutoff * -1 - 1))
                        }
                        Spacer()
                    }
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(.white.opacity(0.01))
                }
                
                VStack {
                    HStack {
                        ForEach(0..<person.imagesURL.count) { index in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == index ? .white : .white.opacity(0.4))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, fullscreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullscreenMode {
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text(String(person.age))
                                        .font(.system(size: 28, weight: .light))
                                }
                                
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation(.easeOut(duration: 0.4)) {
                                    fullscreenMode = true
                                }
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                            })
                        }
                        .padding(16)
                    }
                }
                .shadow(radius: 2)
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example, fullscreenMode: .constant(false))
    }
}
