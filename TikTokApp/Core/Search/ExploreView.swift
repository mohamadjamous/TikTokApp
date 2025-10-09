//
//  ExploreView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/9/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 16){
                    
                    ForEach(0 ..< 20){ user in
                        
                        UserCell()
                            .padding(.horizontal)
                        
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
       
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
