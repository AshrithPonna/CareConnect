//
//  ProfileViewModel.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/9/24.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User){
        self.user = user
    }
    var actionButtontitle: String{
        return user.isCurrentUser ? "Settings" : "Message"
    }
    
}
