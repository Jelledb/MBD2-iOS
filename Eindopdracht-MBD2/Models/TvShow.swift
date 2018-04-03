//
//  TvShow.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 29-03-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import Foundation

struct TvShow {
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String
    let genres: Array<String>
    let status: String
    let officialSite: String
    let rating: [String: Double?]
    let image: [String: String]
    let summary: String
    
    init(json: [String: Any]) {
        self.id = json["id"] as? Int ?? 0
        self.url = json["url"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.type = json["type"] as? String ?? ""
        self.language = json["language"] as? String ?? ""
        self.genres = json["genres"] as? Array<String> ?? []
        self.status = json["status"] as? String ?? ""
        self.officialSite = json["officialSite"] as? String ?? ""
        self.rating = json["rating"] as? [String: Double?] ?? [:]
        self.image = json["image"] as? [String: String] ?? [:]
        self.summary = json["summary"] as? String ?? ""
    }
}
