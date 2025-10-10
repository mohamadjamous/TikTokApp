//
//  PostGridView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/10/25.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        
        LazyVGrid(columns: items){
            ForEach(0 ..< 25){ post in
                Rectangle()
                    .frame(width: 100, height: 160)
                    .clipped()
                
            }
            
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
