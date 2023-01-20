//
//  MainView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 12/01/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userState: UserManager
    
    
    func correctViewForState() -> some View {
        var view: any View
        
        switch appState.selectedTab {
        case .fire:
            view = HomeView()
        case .star:
            view = MatchesView()
        case .message:
            view = MessageListView()
        case .profile:
            view = ProfileView()
        }
        
        return AnyView(view)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        TabBarButtonView(type: .fire)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .star)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .message)
                        
                        Spacer()
                        
                        TabBarButtonView(type: .profile)
                        
                        Spacer()
                    }
                    .frame(height: 100)
                    .padding(.top, 30)
                    
                    correctViewForState()
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.vertical)
                
                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 900))
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
