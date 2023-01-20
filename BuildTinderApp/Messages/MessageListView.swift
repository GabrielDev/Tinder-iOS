//
//  MessageListView.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 16/01/23.
//

import SwiftUI

struct MessageListView: View {
    
    @ObservedObject var vm: MessageListVM = MessageListVM()
    
    @State private var searchText: String = ""
    
    @State private var isEditing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Search Matches", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textfieldBG)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            self.searchText = ""
                            self.isEditing = false
                            self.endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing, 15)
                        .transition(.move(edge: .trailing))
                    }
                }
                .animation(.easeIn(duration: 0.25))
                
                Spacer().frame(height: 14)
                
                ZStack {
                    VStack(alignment: .leading) {
                        ForEach(vm.messagePreviews.filter({ displayPreview($0) }), id: \.self) { preview in
                            NavigationLink(
                                destination: ChatView(person: preview.person),
                                label: {
                                    MessageRowView(preview: preview)
                                }
                            )
                            .buttonStyle(PlainButtonStyle())
                            .transition(.slide)
                            .animation(.easeIn(duration: 0.25))
                        }
                    }
                    .padding(.horizontal)
                    
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                
                Spacer()
            }
        }
        .modifier(HideNavigationView())
    }
    
    
    private func displayPreview(_ preview: MessagePreview) -> Bool {
        if
        preview.person.name.localizedCaseInsensitiveContains(searchText) ||
        preview.lastMessage.localizedCaseInsensitiveContains(searchText) ||
        preview.person.bio.localizedCaseInsensitiveContains(searchText) {
            return true
        }
        
        return searchText.isEmpty
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
