//
//  CoinDetailEntity.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation

struct CoinDetailEntity: Codable {
    var id: String = ""
    var name: String = ""
    var symbol: String = ""
    var rank: Int64 = 0
    var is_new: Bool = false
    var is_active: Bool = false
    var type: String = ""
    var tags: [Tags]?
    var team: [Team]?
    var description: String = ""
    var message: String = ""
    var open_source: Bool = false
    var started_at: String = ""
    var development_status: String = ""
    var hardware_wallet: Bool = false
    var proof_type: String = ""
    var org_structure: String = ""
    var hash_algorithm: String = ""
    var links: Links?
    var links_extended: [LinksExtended] = [] //요거
    var whitepaper: WhitePapaer?
    var first_data_at: String = ""
    var last_data_at: String = ""
}

struct Tags: Codable {
    var id: String = ""
    var name: String = ""
    var coin_counter: Int = 0
    var ico_counter: Int = 0
}

struct Team: Codable {
    var id: String = ""
    var name: String = ""
    var position: String = ""
}

struct Links: Codable {
    var explorer: [String] = []
    var facebook: [String] = []
    var reddit: [String] = []
    var source_code: [String] = []
    var website: [String] = []
    var youtube: [String] = []
}

struct LinksExtended: Codable {
    var url: String = ""
    var type: String = ""
    var stats: Stats?
}

struct Stats: Codable {
    var subscribers: Int?
    var contributors: Int? 
    var stars: Int?
    var followers: Int?
}

struct WhitePapaer: Codable {
    var link: String = ""
    var thumbnail: String = ""
}

