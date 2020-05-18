//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Ezra Black on 5/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

/// A Simple Data Loader used for making network requests.
protocol NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
}

