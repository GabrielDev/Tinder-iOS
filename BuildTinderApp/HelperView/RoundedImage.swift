//
//  RoundedImage.swift
//  BuildTinderApp
//
//  Created by Gabriel dos Santos on 12/01/23.
//

import SwiftUI
import Kingfisher

struct RoundedImage: View {
    
    var url: URL?
    
    var body: some View {        
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .clipped()
        
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
