//
//  SignUpUserViewModel.swift
//  MVVM
//
//  Created by Dylan caetano on 29/12/2025.
//

import Foundation
import Observation

@Observable
class SignUpUserViewModel {
    
    var username = ""
    var email = ""
    var password = ""
    var alertTitle = ""
    var alertMessage = ""
    var showAlert = false
    var showNewPage = false
    
    private(set) var user: SignUpUserModel?
    
    func validateAndCreateUser() {
        guard validateEmail() && validateUsername() else { return }
        
        user = SignUpUserModel(
            username: username,
            email: email,
            password: password
        )
        showNewPage = true
    }
    
    private func validateUsername() -> Bool {
        guard !username.isEmpty else {
            alertTitle = "Username Required"
            alertMessage = "Please provide a username"
            showAlert = true
            return false
        }
        return true
    }
    
    private func validateEmail() -> Bool {
        guard !email.isEmpty else {
            alertTitle = "Email Required"
            alertMessage = "Please provide an email"
            showAlert = true
            return false
        }
        return true
    }
}
