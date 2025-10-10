//
//  ProfileHeaderView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/10/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        
        VStack(spacing: 16){
            
            VStack(spacing: 8){
                
                // profile image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                // username
                Text("@lwis.hamilton")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
            // stats view
            HStack(spacing: 16){
                
                UserStateView(value: 10, title: "following")
                
                UserStateView(value: 1, title: "followers")
                
                UserStateView(value: 5, title: "likes")
            }
            
            
            // action button
            Button{
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                
            }
            
            
            Divider()
            
            
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
