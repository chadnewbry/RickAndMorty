//
//  CharacterStore.swift
//  RickAndMorty
//
//  Created by Chad Newbry on 9/7/24.
//

import Foundation

enum CharacterStoreError: Error {
    case resourceNotFound
}

class CharacterStore {
    static func fetch() async throws -> [Character] {

        // start by fetching locally from JSON
        // TODO: consider protocol and injection

        if let url = Bundle.main.url(forResource: "character", withExtension: ".json") {
            // we found the resource we execpt

            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()

            do {
                let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                return characterResponse.results
            } catch {
                print(error)
            }



        }

        throw CharacterStoreError.resourceNotFound
    }
}
