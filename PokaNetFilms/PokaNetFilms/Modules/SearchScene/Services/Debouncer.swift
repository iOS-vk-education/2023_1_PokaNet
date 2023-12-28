//
//  Debouncer.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 25.12.2023.
//

import Foundation

public class Debouncer: NSObject {
    
    public var callback: ((String?) -> Void)
    public var delay: Double
    public weak var timer: Timer?
    public var query: String?
    
    public init(delay: Double, callback: @escaping ((String?) -> Void)) {
        self.delay = delay
        self.callback = callback
    }
    
    public func call(_ query: String?) {
        self.query = query
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(fireNow), userInfo: nil, repeats: false)
    }
    
    @objc func fireNow() {
        self.callback(query)
    }
}
