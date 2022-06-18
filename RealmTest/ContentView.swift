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
    
    init(){
        //デフォルトRealmの取得
        let realm = try! Realm()
        //追加するデータの生成
        let user:UserTable = UserTable(value: ["ID" : 2 ,
                                               "userName" : "user2"])
        

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
        VStack(){
            Text("登録されたユーザ")
            HStack {
                Text(allUser![0].ID.description)
                Text(allUser![0].userName)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
