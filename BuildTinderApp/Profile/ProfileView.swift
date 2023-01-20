//
//  ProfileView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 12/01/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appManager: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                RoundedImage(url: user.imageURL)
                    .frame(height: 175)
                
                Button(action: {}, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                })
                .padding(.vertical, 10)
                .offset(x: -10)
            }
            
            Spacer().frame(height: 18)
            
            Group {
                Text("\(user.name), \(user.age)")
                    .foregroundColor(.textTitle)
                    .font(.system(size: 26, weight: .medium))
                
                Spacer().frame(height: 8)
                
                Text("\(user.bio)")
                
                Spacer().frame(height: 22)
            }
            
            HStack(alignment: .top) {
                Spacer()
                
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SETTINGS")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 38))
                            .padding(22)
                            .background(.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("ADD MEDIA")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "shield.fill")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SAFETY")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                
                Spacer()
            }
            
            Spacer().frame(height: 14)
            
            if !user.profileTip.isEmpty {
                HStack {
                    Text(user.profileTip)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 12, weight: .heavy))
                            .foregroundColor(.pink)
                            .padding(6)
                    })
                    .background(.white)
                    .clipShape(Circle())
                }
                .padding()
                .background(.pink)
                .cornerRadius(12)
                .padding(.horizontal, 8)
            }
                
            if !user.goldSubscriber {
                ZStack {
                    Color.gray.opacity(0.15)
                    
                    ProfileSwipePromo {
                        appManager.showPurchaseScreen()
                    }
                }
                .padding(.top, 18)
            }
            
            Spacer()
        }
        .foregroundColor(.black.opacity(0.75))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
