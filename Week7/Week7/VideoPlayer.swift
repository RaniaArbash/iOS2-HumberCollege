import SwiftUI
import _AVKit_SwiftUI

struct VideoPlayerView: View {

    @State private var player = AVPlayer(url: URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")! )

    var body: some View {

        VideoPlayer(player: player)
            .frame(height: 300)
            .cornerRadius(10)
            .padding()
            .onAppear {
                print("Video loading: \(player.currentItem?.status.rawValue ?? -1)")
                player.play() // ✅ Auto-play when view appears
            }
    }
}

