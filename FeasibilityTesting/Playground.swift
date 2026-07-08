//
//  Playground.swift
//  FeasibilityTesting
//
//  Created by Saujana Shafi on 07/07/26.
//

import Foundation
import FoundationModels
import Playgrounds

@Generable(description: "")
struct Experience {
    var role: String
    var company: String

    @Guide(description: "A brief description of your role", .count(3))
    var descriptions: [String]
}

struct LanguageModelInput {
    
}

class AppleIntelligenceService {
    var session: LanguageModelSession
    private let instructions: String

    init(instructions: String) {
        self.instructions = instructions
        self.session = LanguageModelSession(instructions: instructions)
    }

    func invoke(for message: String) async throws -> String {
        return try await session.respond(to: message).content
    }

    func reset() {
        self.session = LanguageModelSession(instructions: self.instructions)
    }
}

let INSTRUCTION_EXPERIENCE_V1 = """
    You are a professional CV Writer. Help the user build bullet points for their experience description. Use strong action verbs, try to follow the XYZ framework, and try to quantify if possible.

    Make each bullet points a single sentence. Maximum of 3 items.
    """

let INSTRUCTION_JOB_V1 = """
    Extract the keywords from the given job description.
    """

#Playground {
    let session = AppleIntelligenceService(
        instructions: INSTRUCTION_EXPERIENCE_V1
    )

    let response = try await session.invoke(
        for:
            "Here, I learn not only about iOS Development but also about how to make solutions meaningful and impactful. I have been involved in various projects, including developing mobile applications and implementing machine learning models. Other than that, I'm also able to explore many technical skills to support my career as an AI/ML Engineer. On the first challenge I was able to learn about mobile development (Swift, SwiftUI, SwiftData), the architecture and the philosophy behind it. I also learn about Entity-Component-System (ECS) architecture and why it is suitable for game development during challenge 2. Lastly, I learn how to make solutions that are meaningful for our user during challenge 3 and also able to deep dive into LLMs from Agentic to RAG (LangChain, LangGraph, LangSmith, Foundation Models, Context Engineering)."
    )

    print(response)
}
