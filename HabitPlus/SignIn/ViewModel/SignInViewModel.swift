import SwiftUI
import Combine

class SignInViewModel: ObservableObject {

    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: SignInUiState = .none
    @Published var email: String = ""
    @Published var password: String = ""

    init() {
        self.cancellable = publisher.sink { value in
            print("Usuário criado! goToHome: \(value)")
            
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func login(email: String, password: String) {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.uiState = .error("Não foi possível realizar o login")
            self.uiState = .goToHomeScreen
        }
    }

}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeScreen()
    }
    
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpScreen(publisher: publisher)
    }
}
