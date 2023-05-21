//
//  FavoriteSettingsView.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/21/23.
//

import SwiftUI

struct FavoriteSettingsView: View {
    @Binding var isShowingFavoriteSettings: Bool
    @ObservedObject var locationData = LocationData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(locationData.getFavorites(), id: \.self) { favorite in
                        HStack {
                            Button(action: {
                                // Button action
                            }) {
                                Text(favorite.name)
                                    .font(.subheadline)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: Button(action: {
                isShowingFavoriteSettings = false
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.blue)
            })
        }
    }
}
