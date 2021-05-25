//
//  MeetingHeaderView.swift
//  SwiftUI-Scrumdinger
//
//  Created by Cheney on 2021/5/25.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var progress: Double {
        guard secondsRemaining > 0 else {
            return 1
        }
        
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        
        return Double(secondsElapsed) / totalSeconds
    }
    var body: some View {
        VStack() {
            ProgressView(value: progress)
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180).previewLayout(.sizeThatFits)
    }
}
