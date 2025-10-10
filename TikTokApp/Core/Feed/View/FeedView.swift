//
//  FeedView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/8/25.
//

import SwiftUI


struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        VerticalPagingScrollView(posts: viewModel.posts) { post in
                
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
