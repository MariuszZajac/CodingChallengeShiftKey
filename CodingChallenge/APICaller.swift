import Foundation

func fetchAvailableShifts(completion: @escaping (Result<[Shift], Error>) -> Void) {
    let url = URL(string: "https://staging-app.shiftkey.com/api/v2/available_shifts")!

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil))) // Obsługa błędu braku danych
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let shifts = try decoder.decode([Shift].self, from: data)
            completion(.success(shifts))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}
