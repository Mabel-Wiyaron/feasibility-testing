//
//  Item.swift
//  FeasibilityTesting
//
//  Created by Saujana Shafi on 07/07/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
