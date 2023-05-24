//
//  LocationDetailView.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/18/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @State var location: Location
    @Binding var isSelected: Location?
    @GestureState private var dragState = DragState.inactive
    
    let detailViewHeight: CGFloat = 600
    
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    
    var body: some View {
        VStack {
            Text(location.name)
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black) // Set the text color based on the color scheme
            
            HStack {
                ForEach(location.tags, id: \.id) { tag in
                    Button(action: {
                        // Eventually, I want it to perform the same action as typing, for example, "Bakery" into the search bar
                    }) {
                        Text(tag.name)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            Text(location.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black)
        
            Button(action: {
                guard let url = URL(string: location.website) else { return }
                UIApplication.shared.open(url)
            }) {
                Text("Read more on website")
                    .font(.subheadline)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
                guard let url = URL(string: location.appleMapsLink) else { return }
                UIApplication.shared.open(url)
            }) {
                Text(location.address)
                    .font(.headline)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                location.isFavorite.toggle() // Toggle the favorite state
            }) {
                Image(systemName: location.isFavorite ? "star.fill" : "star")
                    .font(.headline)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                withAnimation {
                    isSelected = nil
                }
            }) {
                Image(systemName: "x.circle")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(colorScheme == .dark ? Color.black : Color.white) // Set the background color based on the color scheme
        .cornerRadius(10)
        .padding()
        .frame(height: detailViewHeight)
        .offset(y: dragState.translation.height)
        .gesture(dragGesture)
        .transition(.move(edge: .bottom))
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($dragState) { value, state, _ in
                state = .dragging(translation: value.translation)
            }
            .onEnded { value in
                if value.translation.height > 200 {
                    withAnimation(.easeInOut) {
                        isSelected = nil
                    }
                }
            }
    }
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .dragging(translation: .zero):
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
    }
}
