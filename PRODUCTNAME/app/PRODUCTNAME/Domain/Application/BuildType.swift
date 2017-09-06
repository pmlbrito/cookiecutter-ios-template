//
//  BuildType.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 30/05/2017.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Foundation

/// A representation of the current build type, driven by -D compiler flags.
/// These compiler flags are configured in the Config specific `.xcconfig` file.
enum BuildType {

    /// Debug build (-D DEBUG)
    case debug

    /// App store Release build, no flags
    case release

    /// Whether or not this build type is the active build type.
    static var active: BuildType {
        #if DEBUG
            return .debug
        #else
            return .release
        #endif
    }

    func identifier(suffix: String) -> String {
        guard let bundleIdentifier = Bundle(for: AppDelegate.self).bundleIdentifier else {
            fatalError("Unable to determine bundle identifier")
        }
        return bundleIdentifier.appending(".").appending(suffix)
    }
}
