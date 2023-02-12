//
// GetSignableTransferRequestV1.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetSignableTransferRequestV1: Codable, Hashable {

    /** Amount of the token to transfer */
    public private(set) var amount: String
    /** Ethereum address of the receiving user */
    public private(set) var receiver: String
    /** Ethereum address of the transferring user */
    public private(set) var sender: String
    public private(set) var token: SignableToken

    public init(amount: String, receiver: String, sender: String, token: SignableToken) {
        self.amount = amount
        self.receiver = receiver
        self.sender = sender
        self.token = token
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case receiver
        case sender
        case token
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(receiver, forKey: .receiver)
        try container.encode(sender, forKey: .sender)
        try container.encode(token, forKey: .token)
    }
}

