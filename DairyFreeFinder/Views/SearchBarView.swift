//
//  SearchBarView.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 5/1/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search for a restaurant", text: $searchText)
                .font(.title2)
                //.fontWeight(.semibold)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .padding()
                .padding()
                .padding()
                .padding()
                //.animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "magnifyingglass")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                }
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.primary)
                        .padding()
                        .opacity(searchText.isEmpty ? 0.0 : 0.4)
                        .onTapGesture {
                            searchText = ""
                        }
                }
                .font(.headline)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
