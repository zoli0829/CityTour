//
//  ContentView.swift
//  CityTour
//
//

import SwiftUI

struct PlacesView: View {
	
	let apiClient = APIClient()
	
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
		.task {
			await apiClient.getPlaces(latitude: 51.81932067012039, longitude: -8.400478360360923)
		}
    }
}

#Preview {
    PlacesView()
}
