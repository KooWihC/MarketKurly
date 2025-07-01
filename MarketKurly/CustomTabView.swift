//
//  CustomTabView.swift
//  MarketKurly
//
//  Created by 안치욱 on 6/23/25.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab: Tab = .home

    enum Tab: String, CaseIterable {
        case home, lounge, category, search, my

        var iconName: String {
            switch self {
            case .home:     return "home_icon"
            case .lounge:   return "lounge_icon"
            case .category: return "category_icon"
            case .search:   return "search_icon"
            case .my:       return "mypage_icon"
            }
        }
        var tabTitle: String {
            switch self {
            case .home:     return "홈"
            case .lounge:   return "라운지"
            case .category: return "카테고리"
            case .search:   return "검색"
            case .my:       return "마이컬리"
            }
        }
    }

    var body: some View {
        VStack {
            NavigationBar()
            TopMenu()
        }
        VStack(spacing: 0) {
            contentView
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            tabBar
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch selectedTab {
        case .home:     HomeView()
        case .lounge:   LoungeView()
        case .category: CategoryView()
        case .search:   SearchView()
        case .my:       MyPageView()
        }
    }

    
    // MARK: - Tab Bar
    
    private var tabBar: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                TabBarItem(
                    iconName:  tab.iconName,
                    title:     tab.tabTitle,
                    isSelected: selectedTab == tab
                ) {
                    selectedTab = tab
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(Color.white.shadow(radius: 2))
    }
}


    // MARK: - TabBarItem

private struct TabBarItem: View {
    let iconName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        let color = isSelected ? Color(hex: "#5F0080") : Color(hex: "#333333")
        
        VStack(spacing: 4) {
            Image(iconName)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .foregroundColor(color)
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }
}
