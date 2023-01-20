//
//  MatchesView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 17/01/23.
//

import SwiftUI

struct MatchesView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var selectedTab: LikedTab = .likes
    
    enum LikedTab {
        case likes
        case topPicks
    }
    
    private var buttonText: String {
        if selectedTab == .likes {
            return "SEE WHO LIKES YOU"
        }
        
        return "UNLOCK TOP PICKS"
    }
    
    private func buttonAction() {
        appState.showPurchaseScreen()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        selectedTab = .likes
                    }, label: {
                        Text("\(userManager.matches.count) Likes")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTab = .topPicks
                    }, label: {
                        Text("\(userManager.topPicks.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical, 14)

                if self.selectedTab == .likes {
                    LikesView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            if !userManager.currentUser.goldSubscriber {
                Button(action: {
                    buttonAction()
                }, label: {
                    Text(buttonText)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 36)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .background(.yellow)
                        .cornerRadius(30)
                })
                .buttonStyle(.plain)
                .shadow(radius: 10)
                .padding(.bottom, 40)
            }
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
