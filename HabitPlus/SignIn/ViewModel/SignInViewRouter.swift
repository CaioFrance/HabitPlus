import SwiftUI
import Combine

enum SignInViewRouter {
    static func makeHomeScreen() -> some View {
        return HomeView(viewModel: HomeViewModel())
    }
    
    static func makeSignUpScreen(publisher: PassthroughSubject<Bool, Never>) -> some View {
        let viewModel = SignUpViewModel()
        viewModel.publisher = publisher
        
        return SignUpView(viewModel: viewModel)
    }
}
