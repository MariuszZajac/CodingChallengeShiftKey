import Foundation

class Api: ObservableObject{
    @Published var shift = [Shift]()
    
    func fetchShifts(completion: @escaping ([Shift]) -> ()) {
        guard let url = URL(string: "https://staging-app.shiftkey.com/api/v2/available_shifts?address=Dallas,%20TX&type=week") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            let shift = try! JSONDecoder().decode([Shift].self, from: data!)
            print(shift)
            DispatchQueue.main.async {
                completion(shift)
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
        }
                task.resume()
            }
        }
        
    

