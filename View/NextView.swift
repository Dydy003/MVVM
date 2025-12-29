//
//  NextView.swift
//  MVVM
//
//  Created by Dylan caetano on 29/12/2025.
//

import SwiftUI

struct NextView: View {
    
    let user: SignUpUserModel?
    
    var body: some View {
        VStack {
            if let user {
                Text("Welcome \(user.username) 🎉")
                Text(user.email)
            } else {
                Text("No user data")
            }
        }
        .font(.title)
    }
}

#Preview {
    NextView(user: SignUpUserModel(username: "", email: "", password: ""))
}
