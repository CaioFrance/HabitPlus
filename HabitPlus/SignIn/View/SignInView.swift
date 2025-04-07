import Foundation
import SwiftUI

struct SignInView: View {

    @ObservedObject var signInViewModel: SignInViewModel

    var body: some View {

        ZStack {

            if case SignInUiState.loading = signInViewModel.uiState {
                Text("Carregando....")
            }

            if case SignInUiState.goToHomeScreen = signInViewModel.uiState {
                signInViewModel.homeView()
            } else {
                NavigationStack {

                    ScrollView {

                        VStack(alignment: .center, spacing: 20) {

                            Spacer(minLength: 48)

                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(0)

                                Text("Login")
                                    .foregroundStyle(.orange)
                                    .font(.title.bold())
                                    .padding(.bottom, 8)

                                emailField

                                passwordField

                                enterButton

                                registerLink

                                Spacer()

                                Text("Copyright @\(currentYear())")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 16).bold())
                                    .padding(.top, 16)
                            }

                        }

                        if case SignInUiState.error(let error) = signInViewModel
                            .uiState
                        {

                            Text("")
                                .alert(
                                    "HabitPlus",
                                    isPresented: .constant(!error.isEmpty),
                                    actions: {
                                        Button("Ok") {
                                            // lógica
                                        }
                                    },
                                    message: {
                                        Text(error)
                                    })

                        }

                    }
                    .scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .background(.white)
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)

                }
            }

        }

    }

}

extension SignInView {

    var emailField: some View {
        TextField("email", text: $signInViewModel.email)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .padding(.top)
    }

    var passwordField: some View {
        SecureField("••••••••••", text: $signInViewModel.password)
            .textContentType(.password)
            .textFieldStyle(.roundedBorder)
    }

    var enterButton: some View {
        Button("Entrar") {
            signInViewModel.login(
                email: signInViewModel.email, password: signInViewModel.password
            )
        }
        .buttonStyle(.bordered)
        .tint(.orange)
        .padding()
    }

    var registerLink: some View {
        VStack {

            Text("Ainda não possui uma conta?")
                .foregroundStyle(.gray)
                .padding(.top, 48)

            ZStack {

                NavigationLink(
                    "Entre agora!", destination: signInViewModel.signUpView())

            }

        }
    }

    func currentYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"

        let year = dateFormatter.string(from: Date())

        return year
    }

}

#Preview {
    SignInView(signInViewModel: SignInViewModel())
}
