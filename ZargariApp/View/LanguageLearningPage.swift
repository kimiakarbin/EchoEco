//
//  LanguageLearningPage.swift
//  ZargariApp
//
//  Created by KimiaKarbin on 13/12/24.
//


import SwiftUI

struct LanguageLearningPage: View {
    var body: some View {
        VStack {
            Text("Learn Zargari!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("In Zargari, we add special sounds after every vowel to create a secret language!")
                .font(.body)
                .padding()

            // Add your teaching content here (examples, rules, questions, etc.)

            Spacer()
        }
        .navigationTitle("Zargari Language")
    }
}
