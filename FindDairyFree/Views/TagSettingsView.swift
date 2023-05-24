//
//  TagSettingsView.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/21/23.
//

import SwiftUI

struct TagSettingsView: View {
    @Binding var isShowingTagSettings: Bool
    @ObservedObject var locationData = LocationData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(uniqueTags(from: locationData.locations), id: \.self) { tagName in
                        HStack {
                            Button(action: {
                                // Button action
                            }) {
                                Text(tagName)
                                    .font(.subheadline)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(locationData.getTagWithName(name: tagName).getDescription())
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                // Add additional text or content for the description here
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                Button {
                    //idk
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Tag Settings")
            .navigationBarItems(trailing: Button(action: {
                isShowingTagSettings = false
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.blue)
            })
        }
    }
    
    private func uniqueTags(from locations: [Location]) -> [String] {
        var newTags = [String]()
        for location in locations {
            for t in location.tags {
                if !newTags.contains(t.name) {
                    newTags.append(t.name)
                }
            }
        }
        return newTags
    }
}
