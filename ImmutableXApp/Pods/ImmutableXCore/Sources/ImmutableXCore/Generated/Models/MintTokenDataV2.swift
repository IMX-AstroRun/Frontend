//
// MintTokenDataV2.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MintTokenDataV2: Codable, Hashable {

    /** Token metadata blueprint */
    public private(set) var blueprint: String?
    /** Token ID */
    public private(set) var id: String
    /** List of mint fees */
    public private(set) var royalties: [MintFee]?

    public init(blueprint: String? = nil, id: String, royalties: [MintFee]? = nil) {
        self.blueprint = blueprint
        self.id = id
        self.royalties = royalties
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case blueprint
        case id
        case royalties
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(blueprint, forKey: .blueprint)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(royalties, forKey: .royalties)
    }
}

