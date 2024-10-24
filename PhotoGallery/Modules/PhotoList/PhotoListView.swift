//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Arslan Ilyas on 25/4/22.
//

import SwiftUI

struct PhotoListView <Model>: View where Model:PhotosListViewModelInterface {
    @StateObject private var viewModel: Model
    init (viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100.0, maximum: UIScreen.main.bounds.size.width / 2.0 )),
        GridItem(.flexible(minimum: 100.0, maximum: UIScreen.main.bounds.size.width / 2.0)),
    ]
    let height: CGFloat = 182
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.photoList) { photo in
                            if let imageURL = viewModel.getPhotoURL(photoModel: photo) {
                                PhotoCard(title: photo.ownername ?? "N/A", imageURL: imageURL, tags: photo.tags ?? "", viewModel: viewModel, photo: photo)
                                    .frame(height: height)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle(AppConstants.PageTitle.PhotoListView)
            }
            .onAppear {
                viewModel.fetchPhotoList()
            }
            
            Text("Hello, World!").font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(viewModel: MockPhotoListViewModel(photosFetcher: PhotosAPI()))
    }
}
