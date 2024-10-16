//
//  MainTabView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI
import Kingfisher

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var selectedIndex = 0
    @ObservedObject var viewModel: ProfileViewModel
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        
        if let user = authViewModel.currentUser{
            if(viewModel.user.role == "Patient"){
                TabView(selection: $selectedIndex) {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }.tag(0)
                    
                    NotificationView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "bell")
                        }.tag(1)
                    
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "envelope")
                        }.tag(2)
                    
                    ProfileView(user:user)
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(3)
                }
                
                
            }else{
                TabView(selection: $selectedIndex) {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }.tag(0)
                    
                    ExploreView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }.tag(1)
                    
                    NotificationView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "bell")
                        }.tag(2)
                    
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "envelope")
                        }.tag(3)
                    
                    ProfileView(user:user)
                        .onTapGesture {
                            self.selectedIndex = 4
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(4)
                }
            }
            
        }
    }
}

//
//
//
//#Preview {
//    MainTabView(user: <#User#>)
//}
