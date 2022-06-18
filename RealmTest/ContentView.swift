//
//  ContentView.swift
//  RealmTest
//
//  Created by 5habu on 2022/06/19.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var allUser: Results<UserTable>?
    var user:UserTable = UserTable(value: ["ID" : 1 ,
                                           "userName" : "user2"])
    @State var hoge: String = "a"
    var realm: Realm

    
    init(){
        //デフォルトRealmの取得
        realm = try! Realm()
        

        try! realm.write{
            //全削除
            realm.deleteAll()
            //データの追加
            realm.add(user)
        }

        //データの取得
        allUser = realm.objects(UserTable.self)
    }
    
    var body: some View {
        VStack {
            Button(action: {
                // ボタン効いてるか適当に確認
                hoge = Int.random(in: 1..<10).description
                
            }){
                Text("Add")
            }
            VStack(){
                Text("登録されたユーザ")
                VStack {
                    ForEach(0..<allUser!.count, id: \.self) { num in
                        Text(allUser![num].ID.description)
                        Text(allUser![num].userName)
                        Text(hoge)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
