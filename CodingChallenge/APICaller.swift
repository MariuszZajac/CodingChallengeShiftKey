import Foundation

final class Api {
    func fetchShifts(withinDistance distance: Int, address: String, type: String, StartDateTime: Date?, completion: @escaping ([Shift]) -> ()) {
        
        guard var components = URLComponents(string: "https://staging-app.shiftkey.com/api/v2/available_shifts") else {
            print("Invalid URL")
            return
        }
               
               
        components.queryItems = [
            URLQueryItem(name: "within_distance", value: String(distance)),
            URLQueryItem(name: "address", value: address),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "start_date", value: dateString.startDateTime?) //???? TODO: ERROR!
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
                    let shifts = shiftResponse.data.flatMap { $0.shifts }
                    print(shifts)

                    completion(shifts)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
}


extension Date {
   

    func dateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

