//
//  HTTPManager.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import AlamofireObjectMapper
@testable import BVCarSharing

public enum Status {
    case success
    case failure
}

open class Response {
    open var status: Status = .failure
    open var object: Any? = nil
    open var error: Error? = nil
}

class HTTPManager: NSObject {

    static let sharedInstance = HTTPManager()
    
    let baseUrl = Settings.Network.url
    
    static open func API() -> HTTPManager {
        return HTTPManager.sharedInstance
    }
    
    open func requestCars(success:@escaping (_: Response)->(),
                          failure: @escaping (_:Response)->()) {
        
        let serviceUrl = baseUrl + Settings.Network.cars
        print(serviceUrl)
        Alamofire.request(serviceUrl).responseArray { [unowned self] (response: DataResponse<[Car]>) in
            switch(response.result) {
            case .success( _):
                success(self.httpSuccess(object: response.result.value))
            case .failure(_):
                failure(self.httpError(error: response.result.error))
            }
        }
    }
    
    func httpError(error: Error?) -> Response {
        let errorRepsonse = Response()
        errorRepsonse.error = error
        errorRepsonse.status = .failure
        return errorRepsonse
    }
    
    func httpSuccess(object: Any?) -> Response {
        let successRepsonse = Response()
        successRepsonse.object = object
        successRepsonse.status = .success
        return successRepsonse
    }
}
