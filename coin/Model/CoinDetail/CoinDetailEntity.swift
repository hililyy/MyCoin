//
//  CoinDetailEntity.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation
// -> 리스트는 리스트로 받기
struct CoinDetailEntity: Codable {
    let id: String?
    let name: String?
    let symbol: String?
    let rank: Int?
    let is_new: Bool?
    let is_active: Bool?
    let type: String?
    let tags: [Tags]?
    let team: [Team]?
    let description: String?
    let message: String?
    let open_source: Bool?
    let started_at: String?
    let development_status: String?
    let hardware_wallet: Bool?
    let proof_type: String?
    let org_structure: String?
    let hash_algorithm: String?
    let links: Links?
    let links_extended: [LinksExtended]?
    let whitepaper: [WhitePapaer]?
    let first_data_at: String?
    let last_data_at: String?
}

struct Tags: Codable {
    let id: String?
    let name: String?
    let coun_counter: Int?
    let ico_counter: Int?
}

struct Team: Codable {
    let id: String?
    let name: String?
    let position: String?
}

struct Links: Codable {
    let explorer: [String]?
    let facebook: [String]?
    let reddit: [String]?
    let source_code: [String]?
    let website: [String]?
    let youtube: [String]?
}

struct LinksExtended: Codable {
    let url: String?
    let type: String?
}

struct WhitePapaer: Codable {
    let link: String?
    let thumbnail: String?
}

