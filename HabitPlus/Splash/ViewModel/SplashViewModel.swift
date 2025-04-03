import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUiState = .loading
    @Published var isPulsing: Bool = false
    
    func onApper() {
        // faz algo async e muda o status da uiState
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.uiState = .loading
        }
    }
}
