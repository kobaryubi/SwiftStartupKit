//
//  CardView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/06.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        Text("Card View")
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
