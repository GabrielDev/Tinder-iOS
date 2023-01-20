//
//  Message.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 16/01/23.
//

import Foundation

struct Message: Hashable {
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}

extension Message {
    static let exampleSent = Message(content: "Hello there!")
    static let exampleReceived = Message(content: "Hello!\nHow are you?", person: Person.example)
}
