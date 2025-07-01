//
//  BannerView.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/30/25.
//

import SwiftUI

struct BannerView: View {
    let images: [String] = ["banner1", "banner2", "banner3", "banner4", "banner5", "banner6"]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            TabView(selection: $currentPage) {
                ForEach(images.indices, id: \.self) { idx in
                    Image(images[idx])
                        .resizable()
                        .scaledToFill()
                        .tag(idx)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Text("\(currentPage + 1)/\(images.count)")
                .font(.caption).bold()
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.black.opacity(0.18))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(12)
        }
        .frame(height: 300)
    }
}
