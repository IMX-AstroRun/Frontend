//
// MintsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MintsAPI {

    /**
     Get details of a mint with the given ID
     
     - parameter id: (path) Mint ID. This is the transaction_id returned from listMints 
     - returns: Mint
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getMint(id: String) async throws -> Mint {
        var requestTask: RequestTask?
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestTask = getMintWithRequestBuilder(id: id).execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: { [requestTask] in
            requestTask?.cancel()
        }
    }

    /**
     Get details of a mint with the given ID
     - GET /v1/mints/{id}
     - Get details of a mint with the given ID
     - parameter id: (path) Mint ID. This is the transaction_id returned from listMints 
     - returns: RequestBuilder<Mint> 
     */
    open class func getMintWithRequestBuilder(id: String) -> RequestBuilder<Mint> {
        var localVariablePath = "/v1/mints/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Mint>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get details of a mintable token with the given token address and token ID
     
     - parameter tokenAddress: (path) Address of the ERC721 contract 
     - parameter tokenId: (path) ERC721 token ID 
     - returns: MintableTokenDetails
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getMintableTokenDetailsByClientTokenId(tokenAddress: String, tokenId: String) async throws -> MintableTokenDetails {
        var requestTask: RequestTask?
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestTask = getMintableTokenDetailsByClientTokenIdWithRequestBuilder(tokenAddress: tokenAddress, tokenId: tokenId).execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: { [requestTask] in
            requestTask?.cancel()
        }
    }

    /**
     Get details of a mintable token with the given token address and token ID
     - GET /v1/mintable-token/{token_address}/{token_id}
     - Get details of a mintable token with the given token address and token ID
     - parameter tokenAddress: (path) Address of the ERC721 contract 
     - parameter tokenId: (path) ERC721 token ID 
     - returns: RequestBuilder<MintableTokenDetails> 
     */
    open class func getMintableTokenDetailsByClientTokenIdWithRequestBuilder(tokenAddress: String, tokenId: String) -> RequestBuilder<MintableTokenDetails> {
        var localVariablePath = "/v1/mintable-token/{token_address}/{token_id}"
        let tokenAddressPreEscape = "\(APIHelper.mapValueToPathItem(tokenAddress))"
        let tokenAddressPostEscape = tokenAddressPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{token_address}", with: tokenAddressPostEscape, options: .literal, range: nil)
        let tokenIdPreEscape = "\(APIHelper.mapValueToPathItem(tokenId))"
        let tokenIdPostEscape = tokenIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{token_id}", with: tokenIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MintableTokenDetails>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get a list of mints
     
     - parameter pageSize: (query) Page size of the result (optional)
     - parameter cursor: (query) Cursor (optional)
     - parameter orderBy: (query) Property to sort by (optional)
     - parameter direction: (query) Direction to sort (asc/desc) (optional)
     - parameter user: (query) Ethereum address of the user who submitted this mint (optional)
     - parameter status: (query) Status of this mint (optional)
     - parameter minTimestamp: (query) Minimum timestamp for this mint, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter maxTimestamp: (query) Maximum timestamp for this mint, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter tokenType: (query) Token type of the minted asset (optional)
     - parameter tokenId: (query) ERC721 Token ID of the minted asset (optional)
     - parameter assetId: (query) Internal IMX ID of the minted asset (optional)
     - parameter tokenName: (query) Token Name of the minted asset (optional)
     - parameter tokenAddress: (query) Token address of the minted asset (optional)
     - parameter minQuantity: (query) Min quantity for the minted asset (optional)
     - parameter maxQuantity: (query) Max quantity for the minted asset (optional)
     - parameter metadata: (query) JSON-encoded metadata filters for the minted asset (optional)
     - returns: ListMintsResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func listMints(pageSize: Int? = nil, cursor: String? = nil, orderBy: String? = nil, direction: String? = nil, user: String? = nil, status: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, tokenType: String? = nil, tokenId: String? = nil, assetId: String? = nil, tokenName: String? = nil, tokenAddress: String? = nil, minQuantity: String? = nil, maxQuantity: String? = nil, metadata: String? = nil) async throws -> ListMintsResponse {
        var requestTask: RequestTask?
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestTask = listMintsWithRequestBuilder(pageSize: pageSize, cursor: cursor, orderBy: orderBy, direction: direction, user: user, status: status, minTimestamp: minTimestamp, maxTimestamp: maxTimestamp, tokenType: tokenType, tokenId: tokenId, assetId: assetId, tokenName: tokenName, tokenAddress: tokenAddress, minQuantity: minQuantity, maxQuantity: maxQuantity, metadata: metadata).execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: { [requestTask] in
            requestTask?.cancel()
        }
    }

    /**
     Get a list of mints
     - GET /v1/mints
     - Get a list of mints
     - parameter pageSize: (query) Page size of the result (optional)
     - parameter cursor: (query) Cursor (optional)
     - parameter orderBy: (query) Property to sort by (optional)
     - parameter direction: (query) Direction to sort (asc/desc) (optional)
     - parameter user: (query) Ethereum address of the user who submitted this mint (optional)
     - parameter status: (query) Status of this mint (optional)
     - parameter minTimestamp: (query) Minimum timestamp for this mint, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter maxTimestamp: (query) Maximum timestamp for this mint, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter tokenType: (query) Token type of the minted asset (optional)
     - parameter tokenId: (query) ERC721 Token ID of the minted asset (optional)
     - parameter assetId: (query) Internal IMX ID of the minted asset (optional)
     - parameter tokenName: (query) Token Name of the minted asset (optional)
     - parameter tokenAddress: (query) Token address of the minted asset (optional)
     - parameter minQuantity: (query) Min quantity for the minted asset (optional)
     - parameter maxQuantity: (query) Max quantity for the minted asset (optional)
     - parameter metadata: (query) JSON-encoded metadata filters for the minted asset (optional)
     - returns: RequestBuilder<ListMintsResponse> 
     */
    open class func listMintsWithRequestBuilder(pageSize: Int? = nil, cursor: String? = nil, orderBy: String? = nil, direction: String? = nil, user: String? = nil, status: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, tokenType: String? = nil, tokenId: String? = nil, assetId: String? = nil, tokenName: String? = nil, tokenAddress: String? = nil, minQuantity: String? = nil, maxQuantity: String? = nil, metadata: String? = nil) -> RequestBuilder<ListMintsResponse> {
        let localVariablePath = "/v1/mints"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page_size": pageSize?.encodeToJSON(),
            "cursor": cursor?.encodeToJSON(),
            "order_by": orderBy?.encodeToJSON(),
            "direction": direction?.encodeToJSON(),
            "user": user?.encodeToJSON(),
            "status": status?.encodeToJSON(),
            "min_timestamp": minTimestamp?.encodeToJSON(),
            "max_timestamp": maxTimestamp?.encodeToJSON(),
            "token_type": tokenType?.encodeToJSON(),
            "token_id": tokenId?.encodeToJSON(),
            "asset_id": assetId?.encodeToJSON(),
            "token_name": tokenName?.encodeToJSON(),
            "token_address": tokenAddress?.encodeToJSON(),
            "min_quantity": minQuantity?.encodeToJSON(),
            "max_quantity": maxQuantity?.encodeToJSON(),
            "metadata": metadata?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ListMintsResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Mint Tokens V2
     
     - parameter mintTokensRequestV2: (body) details of tokens to mint 
     - returns: MintTokensResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func mintTokens(mintTokensRequestV2: [MintRequest]) async throws -> MintTokensResponse {
        var requestTask: RequestTask?
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestTask = mintTokensWithRequestBuilder(mintTokensRequestV2: mintTokensRequestV2).execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: { [requestTask] in
            requestTask?.cancel()
        }
    }

    /**
     Mint Tokens V2
     - POST /v2/mints
     - Mint tokens in a batch with fees
     - responseHeaders: [Mint_Limit_Reset(String), Mint_Limit(String), Mint_Remaining(String)]
     - parameter mintTokensRequestV2: (body) details of tokens to mint 
     - returns: RequestBuilder<MintTokensResponse> 
     */
    open class func mintTokensWithRequestBuilder(mintTokensRequestV2: [MintRequest]) -> RequestBuilder<MintTokensResponse> {
        let localVariablePath = "/v2/mints"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: mintTokensRequestV2)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MintTokensResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
