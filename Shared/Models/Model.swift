//
//  Model.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 1/04/22.
//

import Foundation

struct Games: Codable {
    let games: [Game]
}

struct Game: Codable {
    let title, studio, contentRaiting, publicationYear: String
    let welcomeDescription: String
    let platforms, tags: [String]
    let videosUrls: VideosUrl
    let galleryImages: [String]

    enum CodingKeys: String, CodingKey {
        case title, studio, contentRaiting, publicationYear
        case welcomeDescription = "description"
        case platforms, tags, videosUrls, galleryImages
    }
}

struct VideosUrl: Codable {
    let mobile, tablet: String
}

typealias Welcome = [Games]
