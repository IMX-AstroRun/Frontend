//
// MintUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MintUser: Codable, Hashable {

    /** List of Mint tokens */
    public private(set) var tokens: [MintTokenDataV2]
    /** User wallet address */
    public private(set) var user: String

    public init(tokens: [MintTokenDataV2], user: String) {
        self.tokens = tokens
        self.user = user
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tokens
        case user
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tokens, forKey: .tokens)
        try container.encode(user, forKey: .user)
    }
}

