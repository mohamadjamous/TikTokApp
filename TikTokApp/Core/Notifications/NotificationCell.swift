//
//  NotificationCell.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/9/25.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(Color(.systemGray5))
            
            HStack{
                Text("max.verstappen")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("liked one of your posts.")
                    .font(.footnote)
                
                Text("3")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
