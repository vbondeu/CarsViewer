//
//  DBManager.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager: NSObject {
    
    static let sharedInstance = DBManager()
    var dbInstance : Realm?
    
    override init() {
        super.init()
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = path.appendingPathComponent("bv.realm")
        let fileManager = FileManager.default
        
        guard !fileManager.fileExists(atPath: filePath) else {
            return
        }
        
        if let db = Bundle.main.path(forResource: "RealmCarsSharing", ofType: "realm") {
            try! fileManager.copyItem(atPath: db, toPath: filePath)
        }
        
        do {
            self.dbInstance = try Realm()
        } catch {
            print("It failed")
        }
    }
    
    func getObjects<T: Object>(objectClass: T.Type) -> Results<T>? {
        return self.dbInstance?.objects(objectClass)
    }
    
    func insert<T: Object>(object: T){
        do {
            try self.dbInstance?.write{
                self.dbInstance?.add(object)
            }
        } catch {
            print("It failed to write object", object)
        }
    }
    
    func insertOrUpdate<T: Object>(object: T){
        do {
            try self.dbInstance?.write{
                self.dbInstance?.add(object, update: true)
            }
        } catch {
            print("It failed to write object", object)
        }
    }
}
