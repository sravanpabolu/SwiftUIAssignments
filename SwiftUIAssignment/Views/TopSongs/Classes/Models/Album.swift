//
//  Album.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 24/05/22.
//

import Foundation

struct Album: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

struct Author: Codable {
    let name: String
    let url: String
}

struct Link: Codable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

struct Result: Codable {
    let artistName, id, name, releaseDate: String
    let kind: String?
    let artistID: String?
    let artistURL: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

