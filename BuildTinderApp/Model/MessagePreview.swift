//
//  MessageThread.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 16/01/23.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
    
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today?\nHow's the weather where you live right now?")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person:
                        Person(
                            name: "Joana",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/400")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/401/401")!,
                            ],
                            bio: "I love dogs",
                            age: 28,
                            distance: 5),
                       lastMessage: "Hello"),
        
        MessagePreview(person:
                        Person(
                            name: "Christina",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/401/401")!,
                                URL(string: "https://picsum.photos/400/401")!,
                            ],
                            bio: "I love cats",
                            age: 32,
                            distance: 15),
                       lastMessage: "See you"),
        
        MessagePreview(person:
                        Person(
                            name: "Suzana",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/402")!,
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/401/401")!,
                            ],
                            bio: "I'm software engineer",
                            age: 35,
                            distance: 20),
                       lastMessage: "What are you doing?"),
        
        MessagePreview(person:
                        Person(
                            name: "April",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/403")!,
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/401/401")!,
                            ],
                            bio: "I love to play guitar",
                            age: 33,
                            distance: 18),
                       lastMessage: "Bye"),
        
        MessagePreview(person:
                        Person(
                            name: "Cintia",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/404")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/401/401")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/400/401")!,
                            ],
                            bio: "I love painting",
                            age: 29,
                            distance: 16),
                       lastMessage: "Of course!"),
        
        MessagePreview(person:
                        Person(
                            name: "Samantha",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/405")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/401/401")!,
                            ],
                            bio: "I love to hike",
                            age: 31,
                            distance: 32),
                       lastMessage: "Sure"),
        
        MessagePreview(person:
                        Person(
                            name: "Olivia",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/406")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/401/401")!,
                                URL(string: "https://picsum.photos/400/401")!,
                            ],
                            bio: "I love to sing",
                            age: 33,
                            distance: 2),
                       lastMessage: "Call me"),
        
        MessagePreview(person:
                        Person(
                            name: "Sophia",
                            imagesURL: [
                                URL(string: "https://picsum.photos/400/407")!,
                                URL(string: "https://picsum.photos/400/399")!,
                                URL(string: "https://picsum.photos/400/401")!,
                                URL(string: "https://picsum.photos/399/400")!,
                                URL(string: "https://picsum.photos/401/401")!,
                            ],
                            bio: "I like to skateboard",
                            age: 27,
                            distance: 3),
                       lastMessage: "See ya!"),
        
        example,
    ]
}

