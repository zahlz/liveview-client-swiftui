import SwiftUI
import PhoenixLiveViewNative

struct NavFavoriteModifier: ViewModifier {
    let value: String
    let context: LiveContext<MyRegistry>
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                }
            }
    }
}
