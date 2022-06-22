//
//  ContentView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Todos View")
            .navigationTitle("Todos")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
