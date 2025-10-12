//
//  FeedViewModel.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/10/25.
//

import Foundation


class FeedViewModel: ObservableObject{
    
    @Published var posts = [Post]()
    
    let videoURLs: [String] = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
    ]
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoURLs[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoURLs[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoURLs[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoURLs[3]),
            .init(id: NSUUID().uuidString, videoUrl: videoURLs[4]),
        ]
    }
    
}
