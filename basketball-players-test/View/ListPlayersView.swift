import SwiftUI

struct ListPlayersView: View {
    @StateObject private var viewModel = PlayerDataService()

        var body: some View {
            NavigationStack {
                List(viewModel.players) { player in
                    NavigationLink(destination: PlayerDetailView(player: player)) {
                        HStack(spacing: 20) {
                            Text(player.fullName)
                                .font(.headline)
                            Text("height: \(player.getHeight)")
                                .font(.caption)
                            Text("pos: \(player.playerPosition)")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle("NBA Players")
                .onAppear {
                    viewModel.fetchPlayers()
                }
            }
    }
}

#Preview {
    ListPlayersView()
}
