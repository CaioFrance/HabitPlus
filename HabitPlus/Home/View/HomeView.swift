import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("HomeView")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
