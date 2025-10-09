//
//  NotificationsView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/9/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack{
            
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(0 ..< 20){ notification in
                        NotificationCell()
                        
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
