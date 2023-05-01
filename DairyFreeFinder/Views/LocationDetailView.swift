//
//  LocationDetailView.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 4/30/23.
//

import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(location.name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .ignoresSafeArea()
        
    }
    
    struct LocationDetailView_Previews: PreviewProvider {
        static var previews: some View {
            LocationDetailView(location: LocationsDataService.locations.first!)
        }
    }
}

extension LocationDetailView {
    private var imageSection: some View {
            TabView {
                ForEach(location.imageNames, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                }
            }
            .frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
    }
}

