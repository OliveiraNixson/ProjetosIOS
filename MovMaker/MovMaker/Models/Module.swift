//
//  Module.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 02/12/25.
//

import Foundation

struct Module: Codable, Identifiable{
    let id: Int
    let week: Int
    let title: String
    let days: [Int]
}
