import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case 0:
                    MainView(viewModel: viewModel)
                case 1:
                    CategoryScreen()
                case 2:
                    CartScreen()
                case 3:
                    OffersScreen()
                case 4:
                    AccountScreen()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // Adjust as needed
            
            HStack {
                TabBarItem(iconName: "house.fill", title: "Home", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                Spacer()
                TabBarItem(iconName: "square.grid.2x2.fill", title: "Category", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                Spacer()
                TabBarItem(iconName: "cart.fill", title: "Cart", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                Spacer()
                TabBarItem(iconName: "tag.fill", title: "Offers", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
                Spacer()
                TabBarItem(iconName: "person.fill", title: "Account", isSelected: selectedTab == 4) {
                    selectedTab = 4
                }
            }
            .frame(height: 60)
            .background(Color(hex:"#D3D3D3" ))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarItem: View {
    let iconName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            if isSelected {
                ZStack {
                    Circle()
                        .foregroundStyle(Color(hex:"#D3D3D3" ))
                        .frame(width: 55, height: 55)
//                        .shadow(radius: 5)

                    Circle()
                        .foregroundColor(Color(hex: "#9EC65C"))
                        .frame(width: 40, height: 40)
                        .shadow(radius: 5)
                    
                    Image(systemName: iconName)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .offset(y: -10) 
            } else {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                    .foregroundStyle(Color(hex:"#333333"))
            }
            
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .black : Color(hex:"#333333" ))
                .offset(y: isSelected ? -16 : 0) // Slight upward offset when selected
        }
        .onTapGesture {
            action()
        }
        .frame(maxWidth: .infinity)
    }
}

// Placeholder views for content
//struct HomeView: View {
//    var body: some View {
//        Text("Home Screen")
//    }
//}

//struct CategoryView: View {
//    var body: some View {
//        Text("Category Screen")
//    }
//}
//
//struct CartView: View {
//    var body: some View {
//        Text("Cart Screen")
//    }
//}
//
//struct OffersView: View {
//    var body: some View {
//        Text("Offers Screen")
//    }
//}
//
//struct AccountView: View {
//    var body: some View {
//        Text("Account Screen")
//    }
//}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView()
//    }
//}
