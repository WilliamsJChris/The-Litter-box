//
//  ContentView.swift
//  The Sand Box
//
//  Created by Christopher Williams on 4/30/20.
//  Copyright © 2020 ThunderCats. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selection = 1
    @State private var gameType: String = ""
    @State private var locationName: String = ""
    @State private var address1: String = ""
    @State private var address2: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zip: String = ""
    @State private var date: String = ""
    @State private var time: String = ""
 
    var body: some View {
        TabView(selection: $selection){
            NavigationView{
                List (locationData, id: \.id) { location in MapItemRow(location: location)
                }
                .navigationBarTitle("List of Games", displayMode: .large)
            }
            .font(.title)
            .tabItem {
                VStack {
                    Image("list")
                    Text("List")
                }
            }
            .tag(0)
            
            NavigationView {
                MapView()
                    .navigationBarTitle("The Sand-Box", displayMode: .inline)
            }
            .font(.title)
            .tabItem {
                VStack {
                    Image("map")
                    Text("Map")
                }
            }
            .tag(1)
            
            NavigationView {
                Form {
                    Section() {
                        TextField("Game Type", text: $gameType)
                    }
                    Section(header: Text("When?")) {
                        TextField("MM/DD/YY", text: $date)
                        TextField("HH:MM AM/PM", text: $time)
                    }
                    Section(header: Text("Where?")) {
                        TextField("Address", text: $address1)
                        TextField("Address 2", text: $address2)
                        TextField("City", text: $city)
                        TextField("State Acronym", text: $state)
                        TextField("Zip Code", text: $zip)
                    }
                    Section() {
                        Button(action: {
                            saveToJSON(gameType: self.gameType, locationName: self.locationName, address1: self.address1, address2: self.address2, city: self.city, state: self.state, zip: self.zip, date: self.date, time: self.time)
                        }) {
                            Text("Submit")
                        }
                    }
                }
                .navigationBarTitle("Add a Game", displayMode: .large)
            }
            .tabItem {
                VStack {
                    Image("map_pin")
                    Text("Add")
                }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
            annotation.subtitle = String(location.id)
            uiView.addAnnotation(annotation)
        }
    }
}

func saveToJSON(gameType: String, locationName: String, address1: String, address2: String, city: String, state: String, zip: String, date: String, time: String) {
    
    var newLocation = Location()
    newLocation.gameType = gameType
    newLocation.locationName = locationName
    newLocation.address1 = address1
    newLocation.address2 = address2
    newLocation.city = city
    newLocation.state = state
    newLocation.zip = zip
    newLocation.date = date
    newLocation.time = time
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted]
    if
      let writtenData = try? encoder.encode(newLocation),
      let jsonString = String(data: writtenData, encoding: .utf8) {
        try! jsonString.write(to: URL(fileURLWithPath: "data.json"), atomically: false, encoding: .utf8)
    }
}

