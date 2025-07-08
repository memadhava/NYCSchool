//
//  SchoolsHomeScreen.swift
//  NYCSchools
//
//  Created by Madhav Gadve on 7/2/25.
//

import SwiftUI

struct SchoolsHomeScreen: View {
    
    //@State private var searchText = ""
    @ObservedObject private var viewModel = SchoolsViewModel(schoolsNetwork: SchoolsNetworkManager())
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if !viewModel.showError.isEmpty {
                Text(viewModel.showError)
                    .foregroundStyle(.red)
            }else {
                List {
                    ForEach(viewModel.filteredSchools, id: \.dbn) { school in
                        
                        NavigationLink(destination: SchoolDetailsView(school: school)) {
                            VStack(alignment: .leading) {
                                Text("\(school.school_name)")
                                    .font(.title)
                                    .bold()
                                    .bold()
                                Text("\(school.location)")
                                    .font(.subheadline)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Search")
                .navigationTitle("NYC Schools")
            }
        }
        .task {
            await viewModel.fetchSchools()
        }
    }
}

#Preview {
    SchoolsHomeScreen()
}


