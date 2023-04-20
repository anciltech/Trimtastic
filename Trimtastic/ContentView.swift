//
//  ContentView.swift
//  Trimtastic
//
//  Created by Ancil Maxwell Hoffman on 19.04.23.
//
//
//
import SwiftUI
//import AVKit
//
//struct ContentView: View {
//    let videosFolderURL = URL(fileURLWithPath: "/Users/Genesis/Movies/Test")
//
//    @State var selectedVideoItem: AVPlayerItem?
//
//    var body: some View {
//        VStack {
//            Text("Test")
//            FilmStripView(videosFolderURL: videosFolderURL, videoSelectionHandler: { playerItem in
//                selectedVideoItem = playerItem
//            })
//            if let selectedVideoItem = selectedVideoItem {
//                VideoPlayer(player: AVPlayer(playerItem: selectedVideoItem))
//                    .frame(height: 200)
//            }
//        }
//    }
//}
//
//
//struct FilmStripView: View {
//    let videosFolderURL: URL
//    let videoSelectionHandler: (AVPlayerItem) -> Void
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack(spacing: 10) {
//                ForEach(videoFiles(), id: \.self) { videoFileURL in
//                    VideoThumbnailView(videoURL: videoFileURL, selectionHandler: videoSelectionHandler)
//                }
//            }
//        }
//    }
//
//    func videoFiles() -> [URL] {
//        do {
//            let fileManager = FileManager.default
//            let videoFiles = try fileManager.contentsOfDirectory(at: videosFolderURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles, .skipsPackageDescendants]).filter { $0.pathExtension == "mp4" }
//            print(videoFiles)
//            return videoFiles
//        } catch {
//            print(error.localizedDescription)
//            return []
//        }
//    }
//}
//
//struct VideoThumbnailView: View {
//    let videoURL: URL
//    let selectionHandler: (AVPlayerItem) -> Void
//
//    var body: some View {
//        let playerItem = AVPlayerItem(url: videoURL)
//
//        Button(action: {
//            selectionHandler(playerItem)
//        }, label: {
//            VideoPlayer(player: AVPlayer(playerItem: playerItem))
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
//        })
//    }
//}
//



//
//  SwiftUI Asynchronous Image with filmstrip from filesystem item
//
//  Created by Halle Winkler on Mar/12/22.
//






struct ContentView: View {
    
    var filmstripSize = 100
    var media = URL(fileURLWithPath: "/Users/Genesis/Movies/Test/Screen Recording 2023-03-07 at 16.28.49.mp4")
    var filmstripCachingSupport = true
    
    var body: some View {
        VStack {
            AsyncFilmstripImage(fromMedia: media, withCachingSupport: filmstripCachingSupport, rows: 3, columns: 4, stillSize: filmstripSize, content: { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: filmstripSize.width, height: filmstripSize.height)
                case .success(let image):
                    image
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            })
        }
    }
    
}




