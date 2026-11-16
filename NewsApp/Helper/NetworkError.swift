import Foundation


enum NetworkError: String, Error {
    case invalidUrl = "Invalid URL"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "The data received from server is invalid"
}
