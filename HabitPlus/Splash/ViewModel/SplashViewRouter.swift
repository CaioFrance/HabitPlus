import SwiftUI

enum SplashViewRouter {
    static func makeSignInView() -> some View {
        return SignInView(signInViewModel: SignInViewModel())
    }

    static func makeHomeView() -> some View {
        return HomeView(viewModel: HomeViewModel())
    }
}
