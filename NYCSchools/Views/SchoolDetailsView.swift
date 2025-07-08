//
//  SchoolDetailsView.swift
//  NYCSchools
//
//  Created by Madhav Gadve on 7/2/25.
//

import SwiftUI
import MapKit

struct SchoolDetailsView: View {
    
    let school: Schools
    
    var body: some View {
        List {
            Section("OVERVIEW") {
                Text(school.overview_paragraph)

            }
            
            Section("Academic Opportunities") {
                Text(school.academicopportunities1 ?? "NA")
                Text(school.academicopportunities2 ?? "NA")
            }
            
            Section("Extracurricular Activities") {
                Text(school.extracurricular_activities ?? "NA")
            }
            
            Section("Location") {
                
                if let lat = Double(school.latitude ?? "0.0"), let lan = Double(school.longitude ?? "0.0") {
                    schoolMap(longitude: lan, latitude: lat)
                        .frame(height: 200)
                        .listRowInsets(.init(.zero))
                } else {
                    Text("Location not available")
                }
                
            }
        }
        .navigationTitle(school.school_name)
        .navigationBarTitleDisplayMode(.large)
        
        
        
    }
}

struct schoolMap: View {
    let longitude: Double
    let latitude: Double
    
    //@State private var region: MKCoordinateRegion
    @State private var position: MapCameraPosition
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.position = .region(MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        Map(position: $position) {
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            Marker("Location", coordinate: location)
        }
    }
    
    // Helper Identifiable wrapper
//        private struct Location: Identifiable {
//            let id = UUID()
//            let coordinate: CLLocationCoordinate2D
//        }
}

#Preview {
    SchoolDetailsView(school: Schools(dbn: "x123", school_name: "Test School", overview_paragraph: "overview_paragraph", location: "location", academicopportunities1: "academicopportunities1", academicopportunities2: "academicopportunities2", extracurricular_activities: "extracurricular_activities", school_email: "test email", phone_number: "phone number", latitude: "testLat", longitude: "testLong"))
}
