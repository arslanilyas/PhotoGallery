//
//  ViewModifier.swift
//  PhotoGallery
//
//  Created by Arslan Ilyas on 29/4/22.
//

import Foundation
import SwiftUI

struct ViewHideModifier: ViewModifier {
    let flag: Bool
    func body(content: Content) -> some View {
        Group {
            if flag {
                EmptyView()
            } else {
                content
            }
        }
    }
}
