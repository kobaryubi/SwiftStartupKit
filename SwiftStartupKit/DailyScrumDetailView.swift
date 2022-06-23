//
//  DailyScrumDetailView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/23.
//

import SwiftUI

struct DailyScrumDetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DailyScrumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DailyScrumDetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
