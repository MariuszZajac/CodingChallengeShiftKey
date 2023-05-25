import Foundation

class Api: ObservableObject {
    var shifts: [Shift] = []

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

            let jsonString = """
                {
                    "data": [
                        {
                            "date": "2023-05-25",
                            "shifts": [
                                {
                                    "shift_id": 6215811,
                                    "start_time": "2023-05-25T18:45:00+00:00",
                                    "end_time": "2023-05-26T03:15:00+00:00",
                                    "normalized_start_date_time": "2023-05-25 13:45:00",
                                    "normalized_end_date_time": "2023-05-25 22:15:00",
                                    "timezone": "Central",
                                    "premium_rate": false,
                                    "covid": false,
                                    "shift_kind": "Evening Shift",
                                    "within_distance": 130,
                                    "facility_type": {
                                        "id": 8,
                                        "name": "Skilled Nursing Facility",
                                        "color": "#AF52DE"
                                    },
                                    "skill": {
                                        "id": 2,
                                        "name": "Long Term Care",
                                        "color": "#007AFF"
                                    },
                                    "localized_specialty": {
                                        "id": 154,
                                        "specialty_id": 8,
                                        "state_id": 44,
                                        "name": "Licensed Vocational Nurse",
                                        "abbreviation": "LVN",
                                        "specialty": {
                                            "id": 8,
                                            "name": "Licensed Vocational/Practical Nurse",
                                            "color": "#AF52DE",
                                            "abbreviation": "LVN/LPN"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            """

            if let jsonData = jsonString.data(using: .utf8) {
                do {
                    let decoder = JSONDecoder()
                    let shiftResponse = try decoder.decode(ShiftResponse.self, from: jsonData)
                    self.shifts = shiftResponse.data.flatMap { $0.shifts }
                    print(self.shifts)

                    DispatchQueue.main.async {
                        completion(self.shifts)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
    }
}
