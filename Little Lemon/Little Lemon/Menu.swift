//
//  Menu.swift
//  Little Lemon
//
//  Created by Mike on 2023-02-22.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            Header()
            
            VStack {
                HStack {
                    Text("Little Lemon")
                        .foregroundColor(colorFromHex("F0C613"))
                        .font(.system(size: 40))
                    Spacer()
                }
               
                HStack {
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.system(size: 26))
                    Spacer()
                }
                
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .frame(height: 100)
                    
                    Spacer()
                    
                    Image("Hero image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(y: -15)
                }
                .offset(y: -25)
                
                TextField("Search menu", text: $searchText)
                    .padding(.leading, 10)
                    .padding([.top, .bottom], 5)
                    .background(.white)
                    .offset(y: -25)
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 10)
            .padding(.bottom, 5)
            .background(colorFromHex("394C45"))
          
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach (dishes) { dish in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dish.title ?? "")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 5)
                                
                                Text(dish.text ?? "")
                                    .font(.system(size: 14))
                                    .padding(.bottom, 5)
                                
                                Text("$\(dish.price ?? "")")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(colorFromHex("394C45"))
                            }
                            
                            Spacer()
                            
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Rectangle())

                            } placeholder: { ProgressView() }
                        }
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data, let result = try? JSONDecoder().decode(MenuList.self, from: jsonData) else {
                print("Error decoding JSON data")
                return
            }
            
            for dish in result.menu {
                let newDish = Dish(context: viewContext)
                newDish.title = dish.title
                newDish.image = dish.image
                newDish.price = dish.price
                newDish.text = dish.description
            }
            
            try? viewContext.save()
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title",ascending: true, selector: #selector(NSString.localizedStandardCompare))
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
