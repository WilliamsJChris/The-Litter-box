//
//  ContentView.swift
//  The Litter Box
//
//  Created by Christopher Williams on 2/11/20.
//  Copyright © 2020 ThunderCats. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var location: Location
    var body: some View {
        VStack {
            NavigationView {
                MapView()
                    .navigationBarTitle("The Sand-Box", displayMode: .inline)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Add to Map")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        // Start Frame Location
        let startLocation = CLLocationCoordinate2D(latitude: 33.44492917135115,
            longitude: -86.81618575369598)
        
        // Frame Location
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        uiView.setRegion(region, animated: true)
        
        for location in locationData {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.locationCoordinate
            annotation.title = location.gameType
            annotation.subtitle = location.locationName
            uiView.addAnnotation(annotation)
        }
    }
}
