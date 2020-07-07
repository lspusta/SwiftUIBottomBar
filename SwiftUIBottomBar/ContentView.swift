//
//  ContentView.swift
//  SwiftUIBottomBar
//
//  Created by Lucas Spusta on 7/7/20.
//

import SwiftUI
import BottomBar_SwiftUI

let bottomBarItems: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: .blue),
    BottomBarItem(icon: "heart", title: "Likes", color: .green),
    BottomBarItem(icon: "message", title: "Messages", color: .orange),
    BottomBarItem(icon: "person.fill", title: "Profile", color: .red)
]

struct BasicView: View {
    let item: BottomBarItem

    var detailText: String {
    "\(item.title) Detail"
}

var destination: some View {
    Text(detailText + " Content")
        .navigationBarTitle(Text(detailText))
}
    
var navigateLinkSettingsStyle: some View {
    NavigationLink(destination: destination) {
        VStack {
            SettingsRow(imageName: "square.and.arrow.up", title: "Action") {
               
            }
        }
        .settingsBackground()
        
    }
    
    
}

var navigateButton: some View {
    NavigationLink(destination: destination) {
        ZStack {
            Rectangle()
                .fill(item.color)
                .cornerRadius(8)
                .frame(height: 52)
                .padding(.horizontal)

            Text("Navigate")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}
    
var homeText: some View {
    Text(item.title)
}

var body: some View {
    VStack {
        navigateLinkSettingsStyle
        Spacer()
        homeText
        Spacer()
        navigateButton
        }
    }
}

struct ContentView : View {
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        bottomBarItems[selectedIndex]
    }
    
    

    var body: some View {
            NavigationView {
                VStack {
                    BasicView(item: selectedItem)
                        .navigationBarTitle(Text(selectedItem.title))
                    BottomBar(selectedIndex: $selectedIndex, items: bottomBarItems)
                }
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
