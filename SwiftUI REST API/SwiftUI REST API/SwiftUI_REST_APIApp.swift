//
//  SwiftUI_REST_APIApp.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import SwiftUI

@main
struct SwiftUI_REST_APIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(QuestionModelData())
        }
    }
}
