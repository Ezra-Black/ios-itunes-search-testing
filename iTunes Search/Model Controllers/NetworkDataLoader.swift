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
