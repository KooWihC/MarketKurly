//
//  TopMenu.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/28/25.
//


import SwiftUI

struct TopMenu: View {
    private let tabs = ["컬리추천", "베스트", "신상품", "알뜰쇼핑", "특가/혜택"]
    @State private var selected = "컬리추천"
    @Namespace private var underlineNamespace

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selected = tab
                        }
                    }) {
                        VStack {
                            Text(tab)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(
                                    selected == tab
                                        ? Color(hex: "#5F0080")
                                        : Color(.darkGray)
                                )
                            if selected == tab {
                                Rectangle()
                                    .fill(Color(hex: "#5F0080"))
                                    .frame(height: 2)
                                    .matchedGeometryEffect(
                                        id: "underline",
                                        in: underlineNamespace
                                    )
                            } else {
                                Color.clear.frame(height: 2)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
            
            Divider()
        }
    }
}
