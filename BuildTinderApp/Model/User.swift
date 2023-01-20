//
//  User.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 17/01/23.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var imageURL: URL?
    var bio: String = ""
    var profileTip: String = ""
    var goldSubscriber: Bool = false
}

extension User {
    static let example = User(
        name: "Gabriel",
        age: 35,
        imageURL: URL(string: "https://picsum.photos/402")!,
        bio: "Software Engineer",
        profileTip: "Photo Tip: Make waves with a beach photo and get more likes",
        goldSubscriber: false
    )
}
