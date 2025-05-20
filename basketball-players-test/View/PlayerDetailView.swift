import SwiftUI

struct PlayerDetailView: View {
    let player: Player
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Full name: \(player.fullName)")
                .font(.title2)
            Text("Height: \(player.getHeight)")
                .font(.headline)
            Text("Position: \(player.playerPosition)")
                .font(.headline)
                .foregroundColor(.red)
        }
        .padding()
        .navigationTitle(player.fullName)
    }
}
