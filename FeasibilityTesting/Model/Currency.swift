//
//  Currency.swift
//  FeasibilityTesting
//
//  Created by Saujana Shafi on 29/03/26.
//

import Foundation
import SwiftData

/// Currency Model
///
/// - Parameters:
///   - id: ``String``.
///   - name: ``String``.
///   - smallestDenominatedValue: ``Int``.
@Model
final class Currency: ActiveRecord, Decodable {
    var id: String

    var name: String

    var smallestDenominatedValue: Int

    init(
        id: String,
        name: String,
        smallestDenominatedValue: Int
    ) {
        self.id = id

        self.name = name

        self.smallestDenominatedValue = smallestDenominatedValue
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case smallestDenominatedValue = "smallest_denominated_value"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(
            keyedBy: CodingKeys.self,
        )

        self.id = try container.decode(
            String.self,
            forKey: .id,
        )
        self.name = try container.decode(
            String.self,
            forKey: .name,
        )
        self.smallestDenominatedValue = try container.decode(
            Int.self,
            forKey: .smallestDenominatedValue,
        )
    }
}
