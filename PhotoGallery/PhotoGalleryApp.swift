//
//  PhotoGalleryApp.swift
//  PhotoGallery
//
//  Created by Arslan Ilyas on 25/4/22.
//

import SwiftUI

@main
struct PhotoGalleryApp: App {
    let viewModel = PhotoListViewModel(photosFetcher: PhotosAPI())
    var body: some Scene {
        WindowGroup {
//            PhotoListView(viewModel: viewModel)
            TempView()
        }
    }
}
