//
//  ContentView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appManager: AppStateManager = AppStateManager()
    @ObservedObject var userManager: UserManager = UserManager()
    
    var body: some View {
        MainView()
            .environmentObject(appManager)
            .environmentObject(userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
