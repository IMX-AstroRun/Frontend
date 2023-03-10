//
// OrderDetails.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct OrderDetails: Codable, Hashable {

    /** Buy orders for this asset */
    public private(set) var buyOrders: [AnyCodable]?
    /** Sell orders for this asset */
    public private(set) var sellOrders: [AnyCodable]?

    public init(buyOrders: [AnyCodable]? = nil, sellOrders: [AnyCodable]? = nil) {
        self.buyOrders = buyOrders
        self.sellOrders = sellOrders
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case buyOrders = "buy_orders"
        case sellOrders = "sell_orders"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(buyOrders, forKey: .buyOrders)
        try container.encodeIfPresent(sellOrders, forKey: .sellOrders)
    }
}

