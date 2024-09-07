//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Chad Newbry on 9/7/24.
//

import SwiftUI

// take and parse the Rick + Morty API
// show a list of Characters
// Click on the character shows a detail view

// first step visual a list of the character model
// second step - JSON locally that get's parsed
// third step - network request to get data
// 4th step - click on a character takes you to a detail view 

struct ContentView: View {

    @State var characters: [Character] = []

    var body: some View {

        List(characters) { character in
            Text(character.name)
        }
        .onAppear {
            Task {
                characters = try await CharacterStore.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
