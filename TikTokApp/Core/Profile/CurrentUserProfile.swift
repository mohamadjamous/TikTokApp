//
//  CurrentUserProfile.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/10/25.
//

import SwiftUI

struct CurrentUserProfile: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack (spacing: 2){
                    
                    // profile header
                    ProfileHeaderView()
                    
                    
                    // post grid view
                    PostGridView()
                    
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile()
    }
}
