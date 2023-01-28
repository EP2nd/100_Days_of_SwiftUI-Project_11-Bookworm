//
//  String-IsTrulyEmpty.swift
//  Bookworm
//
//  Created by Edwin Przeźwiecki Jr. on 28/01/2023.
//

/// Challenge 1:

import Foundation

extension String {
    var isTrulyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
