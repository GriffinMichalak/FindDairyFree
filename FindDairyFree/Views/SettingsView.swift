//
//  SettingsView.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/19/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isShowingSettings: Bool
    @Binding var theme: String
    @State private var isShowingTagSettings = false
    @State private var isShowingFavoriteSettings = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Theme")) {
                    Picker(selection: $theme, label: Text("Theme")) {
                        Text("Light").tag("Light")
                        Text("Dark").tag("Dark")
                        Text("System").tag("System")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Tag Settings")) {
                    Button(action: {
                        isShowingTagSettings = true // Show Tag Settings
                    }) {
                        Text("Manage Tags")
                            .foregroundColor(.blue)
                    }
                }
                
                Section(header: Text("Favorites")) {
                    Button(action: {
                        isShowingFavoriteSettings = true // Show Favorite Settings
                    }) {
                        Text("Manage Favorites")
                            .foregroundColor(.blue)
                    }
                }
            }

            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = false
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.blue)
            })
        }
        .sheet(isPresented: $isShowingTagSettings) {
            TagSettingsView(isShowingTagSettings: $isShowingTagSettings) // Present TagSettingsView
        }
        .sheet(isPresented: $isShowingFavoriteSettings) {
            FavoriteSettingsView(isShowingFavoriteSettings: $isShowingFavoriteSettings) // Present TagSettingsView
        }
        
    }
}
