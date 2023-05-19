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
        Button(action: {
            guard let url = URL(string: "https://forms.gle/GUoL2zTB5vnY8Yhr8") else { return }
            UIApplication.shared.open(url)
        }) {
            Text("Suggest a place")
                .font(.subheadline)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
