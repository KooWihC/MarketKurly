//
//  IconView.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/30/25.
//

import SwiftUI

struct CategoryItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
}

let categories: [CategoryItem] = [
    .init(title: "최저가도전",    iconName: "icon1"),
    .init(title: "멤버스특가",    iconName: "icon2"),
    .init(title: "홈&리빙",      iconName: "icon3"),
    .init(title: "패션",         iconName: "icon4"),
    .init(title: "선물추천",     iconName: "icon5"),
    .init(title: "라이브커머스",  iconName: "icon6"),
    .init(title: "컬리멤버스",   iconName: "icon7"),
    .init(title: "컬리큐레이터", iconName: "icon8"),
    .init(title: "행운출첵",     iconName: "icon9"),
    .init(title: "오늘의타로",   iconName: "icon10"),
    .init(title: "마이컬리맘",   iconName: "icon11"),
    .init(title: "쇼케이스",     iconName: "icon12")
]


struct IconView: View {
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 6)
       var body: some View {
           LazyVGrid(columns: columns, spacing: 16) {
               ForEach(categories) { item in
                   VStack(spacing: 8) {
                       Image(item.iconName)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 42, height: 42)
                           .background(Color(.systemGray6))
                           .clipShape(RoundedRectangle(cornerRadius: 12))
                       Text(item.title)
                           .font(.system(size: 9.5))
                           .lineLimit(1)
                           .foregroundColor(.primary)
                           .frame(maxWidth: .infinity)
                           .multilineTextAlignment(.center)
                   }
                   .frame(maxWidth: .infinity)
               }
           }
           .padding(.horizontal, 4)
           .padding(.vertical, 24)
       }
}
