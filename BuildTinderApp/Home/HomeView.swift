//
//  HomeView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 19/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userState: UserManager
    
    private var person: Person? {
        return userState.cardPeople.last
    }
    
    var body: some View {
        VStack {
            CardStack(people: userState.cardPeople)
            
            Spacer()
            
            HStack {
                CircleButtonView(type: .back) {
                    appState.showPurchaseScreen()
                }
                
                Spacer()
                
                CircleButtonView(type: .no) {
                    if person != nil {
                        userState.swipe(person!, .no)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .star) {
                    if person != nil {
                        if userState.currentUser.goldSubscriber {
                            userState.superLike(person!)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if person != nil {
                        userState.swipe(person!, .like)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .lightning) {
                    appState.showPurchaseScreen()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
