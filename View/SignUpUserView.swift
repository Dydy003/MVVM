//
//  SignUpUserView.swift
//  MVVM
//
//  Created by Dylan caetano on 29/12/2025.
//

import SwiftUI

struct SignUpUserView: View {
    
    @State private var viewModel = SignUpUserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Continue") {
                    viewModel.validateAndCreateUser()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.alertMessage)
            }
            .navigationDestination(isPresented: $viewModel.showNewPage) {
                NextView(user: viewModel.user)
            }
        }
        
    }
}

#Preview {
    SignUpUserView()
}
