//
//  ArraysBootcamp.swift
//  SwiftIntermediate
//
//  Created by Frank Bara on 12/7/21.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
        /*
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }
        filteredArray = dataArray.sorted(by: { $0.points < $1.points })
         */
        
        // filter
        /*
        filteredArray = dataArray.filter({ user in
            return user.points > 50
        })
        filteredArray = dataArray.filter({ $0.points > 20 })
        filteredArray = dataArray.filter({ $0.isVerified })
        */
        
        // map
        /*
//        mappedArray = dataArray.map({ user in
//            return user.name ?? "Error"
//        })
        
        mappedArray = dataArray.map({ $0.name ?? "Error" })
        */
        
        // combine all three
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Frank", points: 5, isVerified: true)
        let user2 = UserModel(name: nil, points: 0, isVerified: false)
        let user3 = UserModel(name: "Shane", points: 85, isVerified: true)
        let user4 = UserModel(name: "Ryan", points: 51, isVerified: false)
        let user5 = UserModel(name: nil, points: 55, isVerified: true)
        let user6 = UserModel(name: "Megan", points: 29, isVerified: true)
        let user7 = UserModel(name: "Kelly", points: 76, isVerified: false)
        let user8 = UserModel(name: "Neo", points: 35, isVerified: true)
        let user9 = UserModel(name: "Trinity", points: 30, isVerified: false)
        let user10 = UserModel(name: "Kahlua", points: 50, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Point: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
