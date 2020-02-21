//
//  NetworkManager.swift
//  ApolloGrapql
//
//  Created by topik mujianto on 21/02/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import Apollo

class NetworkManager {
    static var shared: NetworkManager = NetworkManager()
    let appolo: ApolloClient = {
        
        // Setup header
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "xxxxxxx-yourkey-header": "xxxxx-value-header"
        ]
        let url = URL(string: "xxxxxx-url")!
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url, session: URLSession(configuration:configuration))
        )
    }()
}
