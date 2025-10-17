/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Midterm Programming Assignment
 
 Student: Esmira Babayeva
 
 Instructor: Hellen Pacheco
 
 Date: October 17, 2025
 
 Simple city sighseeing info
 
 */


import SwiftUI
import Foundation





struct ContentView: View {
    
    // Load data from Data.json using Helper.swift
    let places: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")
    
    
    
    var body: some View {
        NavigationView {
            List(places){ place in
                NavigationLink(destination: DetailView(item: place)) {
                    HStack(spacing: 12) {
                        Image(place.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 60)
                            .clipped()
                            .cornerRadius(8)
                        Text(place.name)
                            .font(.headline)
                            .lineLimit(2)
                    }.padding(.vertical, 4)
                }
            }.navigationTitle("Baku City Highlights")
        }
    }
}



// look of one navigated page, can be created as a separate swift file as well
struct DetailView: View {
    let item: Subject // will get the selected place

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, minHeight: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                Text(item.name)
                    .font(.title)
                    .bold()

                Text(item.description)  //more info
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}






#Preview {
    ContentView()
}
