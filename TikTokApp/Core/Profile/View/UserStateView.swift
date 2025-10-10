//
//  UserStateView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/10/25.
//

import SwiftUI

struct UserStateView: View{
    let value: Int
    let title: String
    
    
    var body : some View{
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}

