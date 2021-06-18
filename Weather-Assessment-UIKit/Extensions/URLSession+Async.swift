//
//  URLSession+Async.swift
//  Weather-Assessment-UIKit
//
//  Created by Jean Blignaut on 2021/06/11.
//  Based on https://alfianlosari.medium.com/using-swift-5-5-async-await-to-fetch-rest-api-cb1e4043b55c
//

import Foundation


extension URLSession {
    
    // 1
    func data(with url: URL) async throws -> Data {
        // 2
        try await withCheckedThrowingContinuation { continuation in
            // 3
            dataTask(with: url) { data, _, error in
                // 4
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Bad Response"]))
                }
            }
            .resume()
        }
    }
    
}
