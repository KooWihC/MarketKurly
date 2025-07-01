//
//  HomeView.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/23/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
            ScrollView {
                BannerView()
                IconView()
                SectionHeaderView()
                ProductCarouselView(products: sampleProducts)
            }
        }
    }
}
