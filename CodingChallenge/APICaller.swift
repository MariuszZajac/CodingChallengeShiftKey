import Foundation

class Api: ObservableObject {
    var shifts: [Shift] = []
   
    func fetchShifts(withinDistance distance: Int, address: String, type: String, completion: @escaping ([Shift]) -> ()) {
        guard var components = URLComponents(string: "https://staging-app.shiftkey.com/api/v2/available_shifts") else {
            print("Invalid URL")
            return
        }
        components.queryItems = [
            URLQueryItem(name: "within_distance", value: String(distance)),
            URLQueryItem(name: "address", value: address),
            URLQueryItem(name: "type", value: type)
        ]
        guard let url = components.url else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            
            if let jsonData = data {
                do {
                    let decoder = JSONDecoder()
                    let shiftResponse = try decoder.decode(ShiftResponse.self, from: jsonData)
                    self.shifts = shiftResponse.data.flatMap { $0.shifts }
                    print(self.shifts)
                    
                    DispatchQueue.main.async {
                        completion(self.shifts)
                    }
                    
                    //            if let jsonData = jsonString.data(using: .utf8) {
                    //                do {
                    //                    let decoder = JSONDecoder()
                    //                    let shiftResponse = try decoder.decode(ShiftResponse.self, from: jsonData)
                    //                    self.shifts = shiftResponse.data.flatMap { $0.shifts }
                    //                    print(self.shifts)
                    //
                    //                    DispatchQueue.main.async {
                    //                        completion(self.shifts)
                    //                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

