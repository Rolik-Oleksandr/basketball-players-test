import Foundation

class PlayerDataService: ObservableObject {
    @Published var players: [Player] = []
    
    func fetchPlayers() {
        
        guard let url = URL(string: "https://api.balldontlie.io/v1/players") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("80df0f49-2511-4bb9-8933-60654b6b8a13", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { return }
            
            guard let data = data else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(PlayerResponse.self, from: data)
                DispatchQueue.main.async {
                    self.players = decodedResponse.data
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
