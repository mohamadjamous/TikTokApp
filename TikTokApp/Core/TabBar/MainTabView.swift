//
//  MainTabView.swift
//  TikTokApp
//
//  Created by Mohamad Jamous on 10/8/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTabs = 0
    
    var body: some View {
        TabView{
            
            Text("Feed")
                .tabItem{
                    VStack{
                        Image(systemName: selectedTabs == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTabs == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear{selectedTabs = 0}
                .tag(0)
            
            Text("Friends")
                .tabItem{
                    VStack{
                        Image(systemName: selectedTabs == 1 ? "person.2.fill" : "person.2")
                            .environment(\.symbolVariants, selectedTabs == 1 ? .fill : .none)
                        Text("Friends")
                    }
                }
                .onAppear{selectedTabs = 1}
                .tag(1)
            
            Text("Upload Post")
                .tabItem{
                    Image(systemName: "plus")
                }
            
            
            Text("Notifications")
                .tabItem{
                    VStack{
                        Image(systemName: selectedTabs == 3 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTabs == 3 ? .fill : .none)
                        Text("Notifications")
                    }
                }
                .onAppear{selectedTabs = 3}
                .tag(3)
            
            Text("Profile")
                .tabItem{
                    VStack{
                        Image(systemName: selectedTabs == 4 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTabs == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear{selectedTabs = 4}
                .tag(4)
            
        }
        .tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
