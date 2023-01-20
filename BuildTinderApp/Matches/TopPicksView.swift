//
//  TopPicsView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 17/01/23.
//

import SwiftUI

struct TopPicksView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Tinder Gold for more Top Picks!")
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
                    ForEach(userManager.topPicks) { person in
                        PersonSquare(person: person, blur: !user.goldSubscriber)
                            .frame(height: 240)
                            .onTapGesture {
                                personTapped(person)
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

struct TopPicsView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
