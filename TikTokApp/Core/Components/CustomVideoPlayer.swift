//
//  CustomVideoPlayer.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/12/25.
//

import Foundation
import SwiftUI
import AVKit


struct CustomVideoPlayer: UIViewControllerRepresentable{
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        
        controller.showsPlaybackControls = false // no native play back
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill // makes video full screen
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

