
import Foundation
import Combine

protocol Endpoint {
    var path: String { get }
    var httpMethod: String? { get set }
//    var parameters: [String: Any] { get }
//    var headers: [String: String] { get }
 ///Make sure that the parameters are correct.!!!!
 func request(with baseURL: URL) -> URLRequest?
}

protocol APIClient {
    var baseURL: URL { get }
    var session: URLSession { get }
    
    func fetch<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

class APIClientImpl: APIClient {
    let baseURL: URL
    let session: URLSession
    
    init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func fetch<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = endpoint.request(with: baseURL) else {
            completion(.failure(APIError.incorrectURL(url: "\(URL.self)")))
            return
        }
            session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(APIError.decodingError))
            }
        }.resume()
    }
}















//final class Api {
//    func fetchShifts(withinDistance distance: Int, address: String, type: String, completion: @escaping ([Shift]) -> ()) {
//
//        guard var components = URLComponents(string: "https://staging-app.shiftkey.com/api/v2/available_shifts") else {
//            print("Invalid URL")
//            return
//        }
//
//
//        components.queryItems = [
//            URLQueryItem(name: "within_distance", value: String(distance)),
//            URLQueryItem(name: "address", value: address),
//            URLQueryItem(name: "type", value: type),
//           // URLQueryItem(name: "start_date", value: dateString.startDateTime?) //???? TODO: ERROR! StartDateTime: Date?
//        ]
//
//        guard let url = components.url else {
//            print("Invalid URL")
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            if let jsonData = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let shiftResponse = try decoder.decode(ShiftResponse.self, from: jsonData)
//                    let shifts = shiftResponse.data.flatMap { $0.shifts }
//                    print(shifts)
//
//                    completion(shifts)
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }
//
//        task.resume()
//    }
//}
//
//
//extension Date {
//
//
//    func dateString(format: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        return dateFormatter.string(from: self)
//    }
//}
//
