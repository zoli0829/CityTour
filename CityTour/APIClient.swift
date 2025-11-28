import Foundation
import CoreLocation

class APIClient {

	private let baseURL = "https://places.googleapis.com/v1/places:searchNearby"
	private let googlePlacesKey = GooglePlacesKey.apiKey

	/// Search nearby places (new Places API v1)
	func getPlaces(latitude: Double, longitude: Double, radius: Double = 500) async {
		guard let url = URL(string: baseURL) else { return }

		var request = URLRequest(url: url)
		request.httpMethod = "POST"

		// Required headers
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue(googlePlacesKey, forHTTPHeaderField: "X-Goog-Api-Key")

		// REQUIRED – without this Google returns an error
		request.setValue("places.displayName,places.location,places.id", forHTTPHeaderField: "X-Goog-FieldMask")

		// JSON body for POST
		let body: [String: Any] = [
			"locationRestriction": [
				"circle": [
					"center": [
						"latitude": latitude,
						"longitude": longitude
					],
					"radius": radius
				]
			]
		]

		request.httpBody = try? JSONSerialization.data(withJSONObject: body)

		do {
			let (data, _) = try await URLSession.shared.data(for: request)

			// Debug print raw JSON to verify structure
			if let json = try? JSONSerialization.jsonObject(with: data) {
				print("Raw JSON:", json)
			}

		} catch {
			print("API error:", error.localizedDescription)
		}
	}
}
