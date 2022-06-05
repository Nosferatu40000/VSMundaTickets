//
//  NSObject+ClassName.swift
//  CardGen
//
//  Created by Alex Orlov on 05.06.2022.
//

import Foundation

extension NSObject {
    static func className() -> String {
        return String(describing: Self.self)
    }
}
