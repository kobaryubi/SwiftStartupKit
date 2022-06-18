//
//  ScrumsView.swift
//  SwiftStartupKit
//
//  Created by Masahiko Kobayashi on 2022/06/18.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]

    var body: some View {
        Text("ScrumsView")
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
