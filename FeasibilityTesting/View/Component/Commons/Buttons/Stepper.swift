//
//  Stepper.swift
//  FeasibilityTesting
//
//  Created by Saujana Shafi on 23/03/26.
//

import Foundation
import SwiftUI

struct StepperButtonView: View {
    let left: Bool
    let disabled: Bool
    var action: () -> Void

    var body: some View {
        Button(
            role: nil,
            action: {
                self.action()
            }
        ) {
            Image(systemName: left ? "chevron.left" : "chevron.right")
                .font(.system(.subheadline, design: .rounded))
                .foregroundColor(Color.white)
                .padding(8)
                .background(Color.black, in: Circle())
                .opacity(disabled ? 0.3 : 1)
        }
    }
}

#Preview {
    HStack {
        StepperButtonView(left: true, disabled: false, action: {})

        StepperButtonView(left: false, disabled: false, action: {})
    }
}
