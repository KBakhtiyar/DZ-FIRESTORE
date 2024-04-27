import Foundation

struct User: Codable {
    var born: Int
    var firstName: String
    var lastName: String
}

struct Chat: Codable {
    var text: String
    var date: String
    var id: String
    var isRead: Bool
}

struct UserResponse {
    var born: Int
    var firstName: String
    var lastName: String
    var id: String
    
    init(user: User, id: String) {
        self.born = user.born
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.id = id
    }
}

