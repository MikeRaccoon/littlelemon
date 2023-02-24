//
//  Menu.swift
//  Little Lemon
//
//  Created by Mike on 2023-02-22.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Description")
            
            FetchedObjects() { (dishes: [Dish]) in
                List {
                    ForEach (dishes) { dish in
                        HStack {
                            Text("\(dish.title ?? "") \(dish.price ?? "")")
                            
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
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
            }
            
            try? viewContext.save()
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
        task.resume()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
