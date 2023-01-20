//
//  ProfileSwipePromo.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 12/01/23.
//

import SwiftUI

struct ProfileSwipePromo: View {
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                VStack {
                    Spacer()
                    
                    Text("Get Tinder Gold")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("See who Likes You & more!")
                }
                .padding(.bottom, 64)

                VStack {
                    Spacer()
                    
                    Text("Get Matches Faster")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Boost your profile once a month!")
                }
                .padding(.bottom, 64)

                VStack {
                    Spacer()
                    
                    Text("Increase Your Chances")
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("Boost your profile once a month!")
                }
                .padding(.bottom, 64)
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button(action: { action() }, label: {
                Text("MY TINDER PLUS")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom, 30)
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            ProfileSwipePromo {
                print("Test")
            }
        }
        .frame(height: 400)
    }
}
