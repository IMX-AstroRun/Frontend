//
// GetSignableRegistrationRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetSignableRegistrationRequest: Codable, Hashable {

    /** Ether key of user */
    public private(set) var etherKey: String
    /** Public stark key of the user */
    public private(set) var starkKey: String

    public init(etherKey: String, starkKey: String) {
        self.etherKey = etherKey
        self.starkKey = starkKey
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case etherKey = "ether_key"
        case starkKey = "stark_key"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(etherKey, forKey: .etherKey)
        try container.encode(starkKey, forKey: .starkKey)
    }
}

