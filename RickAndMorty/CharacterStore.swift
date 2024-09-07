//
//  CharacterStore.swift
//  RickAndMorty
//
//  Created by Chad Newbry on 9/7/24.
//

import Foundation

enum CharacterStoreError: Error {
    case resourceNotFound
    case cantBuildURL
    case backendFailure // CN: TODO - pick better name
}

class CharacterStore {

    static func fetchFromNetwork() async throws -> [Character] {
        // CN: TODO - use protocol and have a single fetch method
        // then can make concrete instances with JSONCharacterStore
        // and NetworkCharacterStore (or Similar)

        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw CharacterStoreError.cantBuildURL
        }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw CharacterStoreError.backendFailure
        }

        // otherwise we have the data at this point serialize it

        // CN: TODO - share JSON serialization logic

        let decoder = JSONDecoder()

        do {
            let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
            return characterResponse.results
        } catch {

            // CN: TODO - fix error handling
            print(error)
        }

        throw CharacterStoreError.resourceNotFound
    }

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

                // CN: TODO - fix error handling
                print(error)
            }
        }

        throw CharacterStoreError.resourceNotFound
    }
}
