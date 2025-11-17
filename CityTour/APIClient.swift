//
//  APIClient.swift
//  CityTour
//
//  Created by Zoltan Vegh on 17/11/2025.
//

import Foundation
import CoreLocation

class APIClient {
	
	private let baseURL = "https://places.googleapis.com/v1/places:searchNearby/json"
	private let googlePlacesKey = GooglePlacesKey.apiKey
	
	private func createURL(latitude: Double, longitude: Double, keyword: String) -> URL? {
		var urlComponents = URLComponents(string: baseURL)
		var queryItems: [URLQueryItem] = [
			URLQueryItem(name: "location", value: "\(latitude)" + "," + "\(longitude)"),
			URLQueryItem(name: "rankby", value: "distance"),
			URLQueryItem(name: "keyword", value: keyword),
			URLQueryItem(name: "key", value: googlePlacesKey)
		]
		urlComponents?.queryItems = queryItems
		return urlComponents?.url
	}
	
}
