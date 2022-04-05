//
//  Model.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 1/04/22.
//

import Foundation

struct Result: Codable {
    let results: [Game]
}

struct Games: Codable {
    let games: [Game]
}

struct Game: Codable, Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrl
    let galleryImages: [String]

    enum CodingKeys: String, CodingKey {
        case title, studio, contentRaiting, publicationYear
        case description = "description"
        case platforms, tags, videosUrls, galleryImages
    }
}

struct VideosUrl: Codable, Hashable {
    let mobile, tablet: String
}

typealias Welcome = [Games]
