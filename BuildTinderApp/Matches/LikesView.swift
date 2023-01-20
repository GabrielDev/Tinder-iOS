//
//  LikesView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 17/01/23.
//

import SwiftUI

struct LikesView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Gold to see people who already liked you")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                content: {
                    ForEach(userManager.matches) { match in
                        PersonSquare(person: match, blur: !user.goldSubscriber)
                            .frame(height: 240)
                            .onTapGesture {
                                personTapped(match)
                            }
                    }
                }
            )
            .padding(.horizontal, 6)
        }
    }
    
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
