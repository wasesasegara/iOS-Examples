//
//  ProcessInfo+ext.swift
//  SwiftUI REST API
//
//  Created by Bis  on 22/05/24.
//

import Foundation

extension ProcessInfo {
    var isPreviewing: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
