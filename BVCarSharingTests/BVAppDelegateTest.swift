//
//  BVAppDelegateTest.swift
//  BVCarSharing
//
//  Created by VBond on 4/5/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import XCTest
import UIKit
import RealmSwift

import BVCarSharing

class BVAppDelegateTest: XCTestCase {
    
    let testObj = AppDelegate()
    
    override func setUp() {
        super.setUp()
        self.testObj.window = UIWindow()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAppDelegateInstantiates() {
        XCTAssertNotNil(self.testObj)
    }
    
    func testConfigureDependies() {
        XCTAssertNotNil(self.testObj.appDependencies)
    }
    
    func testAppWindow() {
        XCTAssertNotNil(self.testObj.window!)
    }
    
    // MARK: - V I P objects dependies
    
    func testLaunchApp() {
        XCTAssertTrue(self.testObj.appDependencies.installRootViewControllerIntoWindow(window: self.testObj.window!))
    }
    
    func testMakesViewControllerRootViewController() {
        XCTAssertTrue(self.appDidFinishLaunchingWithOptions())
        guard let _ = self.testObj.window?.rootViewController as? UINavigationController else {
            XCTFail()
            return
        }
    }

    func appDidFinishLaunchingWithOptions() -> Bool {
        return self.testObj.appDependencies.installRootViewControllerIntoWindow(window: self.testObj.window!)
    }
    
}
