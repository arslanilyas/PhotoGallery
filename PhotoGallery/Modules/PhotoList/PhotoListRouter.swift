//
//  Router.swift
//  PhotoGallery
//
//  Created by Arslan Ilyas on 29/4/22.
//

import SwiftUI

enum PhotoListRouter {
    static func makePhotoDetailsView(photo: Photo) -> some View {
        let viewModel = PhotoDetailsViewModel(photosFetcher: PhotosAPI(), photo: photo)
        let view = PhotoDetailsView(viewModel: viewModel)
        return view
    }
}
