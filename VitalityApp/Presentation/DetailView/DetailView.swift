//
//  DetailView.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import SwiftUI

struct DetailView: View {
    let name: String
    var body: some View {
        Text("\(Strings.CardView.titleGreetings), \(name)")
    }
}

#Preview {
    DetailView(name: "Test")
}
