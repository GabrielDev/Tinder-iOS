//
//  MessageListVM.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 16/01/23.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        self.messagePreviews = MessagePreview.examples
    }
}
