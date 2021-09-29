//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
