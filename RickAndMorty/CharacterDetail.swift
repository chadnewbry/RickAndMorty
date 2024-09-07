//
//  SwiftUIView.swift
//  RickAndMorty
//
//  Created by Chad Newbry on 9/7/24.
//

import SwiftUI

struct CharacterDetailView: View {

    @State var character: Character

    var body: some View {
        VStack {
            Text(character.name)
                .font(.largeTitle)
        }
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
}
