//
//  LoadingView.swift
//  XBikeApp
//
//  Created by leonard Borrego on 21/08/22.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center){
            LoadingIndicator(animation: .threeBallsTriangle,
                             color: Color.white,
                             size: .large,
                             speed: .normal)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
