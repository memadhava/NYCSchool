//
//  SchoolsViewModel.swift
//  NYCSchools
//
//  Created by Madhav Gadve on 7/3/25.
//

import Foundation

class SchoolsViewModel: ObservableObject {
    
    @Published var showError: String = ""
    @Published var isLoading = false
    @Published var schools = [Schools]()
    @Published var searchText: String = ""
    
    var filteredSchools: [Schools] {
        if searchText.isEmpty {
            return schools
        } else {
            return schools.filter { $0.school_name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    let schoolsNetwork: SchoolsNetworkProtocol
    
    init(schoolsNetwork: SchoolsNetworkProtocol) {
        self.schoolsNetwork = schoolsNetwork
    }
    
    @MainActor
    func fetchSchools() async {
        isLoading = true
        do {
            schools = try await schoolsNetwork.fetchSchools()
            isLoading = false
        } catch {
            isLoading = false
            showError = error.localizedDescription.debugDescription
        }
    }
    
}

