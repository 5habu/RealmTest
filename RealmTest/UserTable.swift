//
//  UserTable.swift
//  RealmTest
//
//  Created by 5habu on 2022/06/19.
//

import Foundation
import RealmSwift

class UserTable: Object {
    @objc dynamic var ID: Int = 0
    @objc dynamic var userName: String = ""
}
