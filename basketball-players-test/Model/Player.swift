import Foundation

struct Player: Identifiable, Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let position: String?
    let height: String?

    var fullName: String {
        "\(first_name) \(last_name)"
    }

    var getHeight: String {
        guard let height = height else {
            return "nil"
        }
        return height
    }

    var playerPosition: String {
        guard let position = position else {
            return "nil"
        }
        return position
    }
}

struct PlayerResponse: Codable {
    let data: [Player]
}
