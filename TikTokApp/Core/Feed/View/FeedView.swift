//
//  FeedView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/8/25.
//

import SwiftUI
import AVFoundation


struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: Int = 0
    @State private var player = AVPlayer()
    @State private var postId: String = ""
    
    var body: some View {
        
        VerticalPagingScrollView(posts: viewModel.posts, currentPage: $scrollPosition) { post in
                
            FeedCell(post: post, player: player)
                .id(post.id)
                .onAppear{
                    playInitialVideoIfNecessary()   
                }
        }
        .onAppear{
            player.play()
        }
        .ignoresSafeArea() // optional: page fills full screen
        .onChange(of: scrollPosition) { newPage in
            postId = viewModel.posts[scrollPosition].id
            playVideoOnChangeOfScrollPosition(postId: postId)
            print("ScrollPosition: \(newPage)")
            print("CurrentPostId: \(postId)")
        }
    }
    
    
    func playInitialVideoIfNecessary(){
        guard
            scrollPosition == 0,
            let post = viewModel.posts.first,
            player.currentItem == nil else {return}
        
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String){
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId}) else {return}
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
