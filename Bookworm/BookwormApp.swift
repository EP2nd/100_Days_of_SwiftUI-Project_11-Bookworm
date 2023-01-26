//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Edwin Przeźwiecki Jr. on 26/01/2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
