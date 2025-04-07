import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUiState = .none

    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var cellphone = ""
    @Published var gender: Gender = .male

    func signUp() {
        self.uiState = .loading

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.uiState = .error("Deu ruim ao cadastrar")
            self.uiState = .success
            self.publisher.send(true)
        }
    }
}

extension SignUpView {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
