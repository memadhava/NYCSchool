//
//  SchoolsNetworkManager.swift
//  NYCSchools
//
//  Created by Madhav Gadve on 7/3/25.
//

import Foundation



protocol SchoolsNetworkProtocol {
    func fetchSchools() async throws -> [Schools]
}


class SchoolsNetworkManager: SchoolsNetworkProtocol {
    
    func fetchSchools() async throws -> [Schools] {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let schools = try JSONDecoder().decode([Schools].self, from: data)
            print("schools: \(schools)")
            return schools
        } catch {
            throw error
        }
    }
    
    
}
