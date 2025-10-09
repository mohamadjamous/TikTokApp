//
//  FeedView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/8/25.
//

import SwiftUI


struct FeedView: View {
    
    var body: some View {
        
        VerticalPagingScrollView(pageCount: 10) { post in
                
            FeedCell(post: post)
        }
        .ignoresSafeArea() // optional: page fills full screen
        
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
