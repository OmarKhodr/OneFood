//
//  RestaurantsHome.swift
//  OneFood
//
//  Created by Omar Khodr on 01.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSearch = false
    
    private var headerHeight: CGFloat = 100
    
    var body: some View {
        
        NavigationStack {

            ZStack (alignment: .top) {
                
                ScrollView {
                    VStack {
                        
                        RestaurantHorizontalGrid(title: "What's popular", restaurants: ModelData().restaurants)
                            .padding(.top, 40)
                        
                        RestaurantRow(rowName: "Burgers", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Pizzas", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Salads", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Sushi", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Chicken", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Italian", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                        RestaurantRow(rowName: "Asian", items: ModelData().restaurants)
                            .padding(.top, 30)
                        
                    }
                }
                .background(.lightBack)
                .padding(.top, headerHeight - 25)
                /*
                 This is how we got 75:
                 header height = 100
                 search bar height = 50
                 
                 100 - 50/2 = 75
                */
                
                VStack(alignment: .leading) {
                    Spacer()
                    HStack (spacing: 2) {
                        Text("Deliver to ")
                        Text("Home").bold()
                        Image(systemName: "chevron.down")
                            .padding(.leading, 5)
                            .foregroundColor(.brandPrimary)
                    }
                    
                    SearchBarFake()
                    .onTapGesture {
                        showSearch = true
                    }
                }
                .frame(height: headerHeight)
                .padding(.horizontal)
                
            }
            .navigationDestination(isPresented: $showSearch) {
                SearchView()
            }
            
        }
    }
}

#Preview {
    HomeView()
}
