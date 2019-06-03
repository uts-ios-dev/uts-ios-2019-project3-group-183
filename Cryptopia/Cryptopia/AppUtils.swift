//
//  AppUtils.swift
//  BubbleSaga
//
//  Created by Aryan Nateghnia on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import AVFoundation

/// Provides critical functions that are used across the app.
class AppUtils {
    
    /// Returns an instance of a specified plist.
    /// - Parameters:
    ///   - withName: File name of the plist to get.
    /// - Returns:
    ///   - PlistType: An instance of the plist's type specified in the generic.
    static func getPlist<PlistType: Decodable>(withName name: String) -> PlistType? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        guard let xml = FileManager.default.contents(atPath: path.path) else {return nil}
        do {
            let decodedPlist = try PropertyListDecoder().decode(PlistType.self, from: xml)
            return decodedPlist
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    /// Overwrites data to an existing plist or creates a new plist if none exist.
    /// - Parameters:
    ///   - withName: File name of the plist to write to.
    ///   - object: An encodable object.
    static func writePlist<PlistType: Encodable>(withName name: String, object: PlistType) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        do {
            let data = try encoder.encode(object)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
}
