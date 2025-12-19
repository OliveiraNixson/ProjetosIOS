//
//  Page.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 02/12/25.
//

import Foundation
struct Page: Codable, Identifiable{
    let id: Int
    let type: String
    let title: String?
    let content: String?
    let info: String?
    let photo: String?
    let video: String?

}
