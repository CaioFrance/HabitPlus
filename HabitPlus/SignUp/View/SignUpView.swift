import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 4) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)

                Text("Novo Usuário")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.orange)
                    .padding(.bottom, 8)

                VStack(spacing: 24) {
                    fullNameField
                    emailField
                    documentField
                    cellphoneField
                    genderField
                    passwordField

                    enterButton
                        .padding(.top, 12)
                }
                .padding()

                Spacer()
            }
            
            if case SignUpUiState.error(let error) = viewModel.uiState {
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
    }
}

extension SignUpView {
    var fullNameField: some View {
        TextField("Full name", text: $viewModel.fullName)
            .textFieldStyle(.roundedBorder)
    }

    var emailField: some View {
        TextField("Email", text: $viewModel.email)
            .textFieldStyle(.roundedBorder)
    }

    var passwordField: some View {
        SecureField("••••••", text: $viewModel.password)
            .textFieldStyle(.roundedBorder)
    }

    var documentField: some View {
        TextField("Document", text: $viewModel.document)
            .textFieldStyle(.roundedBorder)
    }

    var cellphoneField: some View {
        TextField("cellphone", text: $viewModel.cellphone)
            .textFieldStyle(.roundedBorder)
    }
    
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { gender in
                Text(gender.rawValue)
                    .tag(gender)
            }
        }
        .pickerStyle(.segmented)
    }

    var enterButton: some View {
        Button("Realize o seu Cadastro") {
            viewModel.signUp()
        }
        .buttonStyle(.bordered)
        .tint(.orange)
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
