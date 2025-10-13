//
//  FeedCell.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/9/25.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    
    let post : Post
    var player : AVPlayer
    
    init(post: Post, player: AVPlayer){
        self.post = post
        self.player = player
    }
    
    var body: some View {
        
        ZStack{
            // each page will be exactly the visible screen height
            CustomVideoPlayer(player: player)
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
              
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text("carlos.name")
                            .fontWeight(.semibold)
                        
                        
                        Text("Rocket ship prepare for take off")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    VStack (spacing: 28){
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                        }
                        
                        Button{
                            
                        } label: {
                            
                            VStack{
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundColor(.white)
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                .padding(.bottom, 90)
            }
            .padding()
        }
        .onAppear{
//            player.play()
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
    }
}
