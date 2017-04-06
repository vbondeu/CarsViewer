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
    }
    
    func getObjects<T: Object>(objectClass: T.Type) -> Results<T> {
        do {
            let realm = try! Realm()
            return realm.objects(objectClass)
        } catch {
            print("It failed to read objects")
        }
    }
    
    func insert<T: Object>(object: T){
        let realm = try! Realm()
        do {
            try realm.write{
                realm.add(object)
            }
        } catch {
            print("It failed to write object", object)
        }
    }
    
    func insertOrUpdate<T: Object>(object: T){
        do {
            let realm = try! Realm()
            try realm.write{
                realm.add(object, update: true)
            }
        } catch {
            print("It failed to write object", object)
        }
    }
    
    func removeObject<T: Object>(object: T) {
        self.performWithinTransaction() {
            let realm = try! Realm()
            realm.delete(object)
        }
    }
    
    func removeAllObject(update: @escaping (() -> ())) {
        self.performWithinTransaction() {
            let realm = try! Realm()
            realm.deleteAll()
            DispatchQueue.main.async  {
                update()
            }
        }
    }
    
    private func performWithinTransaction(action: () -> Void) {
        do {
            action()
        } catch {
            print("It failed to perform transaction")
        }
    }

}
