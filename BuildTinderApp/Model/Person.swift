//
//  Person.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 16/01/23.
//

import SwiftUI

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var imagesURL: [URL]
    var bio: String = ""
    var age: Int = 0
    var distance: Int
    var bioLong: String = ""
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}


extension Person {
    static let example = Person(
        name: "Alex",
        imagesURL: [
            URL(string: "https://picsum.photos/400/399")!,
            URL(string: "https://picsum.photos/399/400")!,
            URL(string: "https://picsum.photos/400/400")!,
            URL(string: "https://picsum.photos/401/400")!,
        ],
        bio: "I'm a doctor, and I like hiking, play games and spend my time with family and friends",
        age: 25,
        distance: 20,
        bioLong: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using"
    )
}
