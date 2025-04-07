import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                viewModel.homeView()
            case .error(let error):
                loadingView(error: error)
            }
        }
        .onAppear(perform: viewModel.onApper)
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .scaleEffect(viewModel.isPulsing ? 1.1 : 1.0)
                    .opacity(viewModel.isPulsing ? 0.7 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        value: viewModel.isPulsing
                    )
                    .onAppear {
                        viewModel.isPulsing = true
                    }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color("BackgroundForeground"))
            .ignoresSafeArea()
        }
        .alert(
            "HabitPlus", isPresented: .constant(error != nil),
            actions: {
                Button("Ok") {
                    // lógica
                }
            },
            message: {
                Text(error ?? "")
            })
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel())
}
