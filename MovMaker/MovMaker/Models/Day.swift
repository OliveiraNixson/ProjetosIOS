//
//  Day.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 02/12/25.
//

import Foundation
struct Day: Codable, Identifiable{
    let id: Int
    let introVideoURL: String?
    let pages: [Page]
}
