//
//  UserManager.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 17/01/23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0)
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        let previews = MessagePreview.examples
        self.cardPeople = previews.map { $0.person }
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    
    private func loadMatches() {
        let previews = MessagePreview.examples.shuffled().prefix(5)
        self.matches = previews.map { $0.person }
    }
    
    private func loadTopPicks() {
        let previews = MessagePreview.examples.shuffled().prefix(4)
        self.topPicks = previews.map { $0.person }
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        cardPeople.removeLast()
    }
    
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
    }
}

enum SwipeDirection {
    case like
    case no
}

