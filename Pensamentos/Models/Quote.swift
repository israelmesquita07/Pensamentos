//
//  Quotes.swift
//  Pensamentos
//
//  Created by Israel3D on 17/06/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import Foundation

struct Quote: Codable /*Encodable, Decodable */ {
    let quote:String!
    let author:String!
    let image:String!
    
    var quotesFormatted: String {
        return " “" + quote + "” "
    }
    
    var autorFormatted:String {
        return "- " + author + " -"
    }
}
