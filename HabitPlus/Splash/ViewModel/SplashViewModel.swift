import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUiState = .loading
    @Published var isPulsing: Bool = false

    func onApper() {
        // faz algo async e muda o status da uiState
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            //            self.uiState = .error("Deu erro ao consultar o servidor")
            self.uiState = .goToSignScreen
        }
    }
}

extension SplashViewModel {
    func signInView() -> some View {
        SplashViewRouter.makeSignInView()
    }
    
    func homeView() -> some View {
        SplashViewRouter.makeHomeView()
    }
}
