//
//  MapItem.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

// MARK: - MapItem
struct MapItem: Codable {
    let id, name, slug: String
    let location: Location
    let welcomeDescription, founderQuote: String
    let logo: Logo?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug, location
        case welcomeDescription = "description"
        case founderQuote = "founder_quote"
        case logo
    }
}
