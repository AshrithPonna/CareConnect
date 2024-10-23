//
//  FeedViewModel.swift
//  PsychiatristApp
//
//  Created by Ansh Gupta on 10/22/24.
//

import Foundation

import SwiftUI

class FeedViewModel: ObservableObject {
    let user: User
    
    init(user: User){
        self.user = user
    }

    
}
