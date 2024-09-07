//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Chad Newbry on 9/7/24.
//

struct CharacterResponse: Codable {
    // we want to parse from JSON to our struct
    // using Codable
    var info: Info
    var results: [Character]
}

struct Info: Codable {
    var count: Int
    var pages: Int
    // TODO - eve want to support paging
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String

    let image: String
}
