//
//  ParksClient.swift
//  Parks
//
//  Created by Mariam Babutsidze on 12.02.24.
//

import OpenAPIRuntime
import OpenAPIURLSession

public struct ParksClient {
    public init() {}

    public func getParks() async throws -> [Park] {
        let client = Client(
            serverURL: try Servers.server2(),
            transport: URLSessionTransport()
        )
        let response = try await client.getParks()
        switch response {
        case .ok(let okResponse):
            switch okResponse.body {
            case .json(let parks):
                return parks.compactMap { Park(park: $0) }
            }
        default:
            break
        }
        return []
    }
}
