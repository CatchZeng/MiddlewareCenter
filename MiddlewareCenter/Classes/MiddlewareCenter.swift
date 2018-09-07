//
//  MiddlewareCenter.swift
//  MiddlewareCenter
//
//  Created by CatchZeng on 2018/9/6.
//  Copyright © 2018年 CatchZeng. All rights reserved.
//

import Foundation

public protocol MiddlewareProtocol {
    var ctx: Any? { get set }
    var next: MiddlewareProtocol? { get set }
    func execute()
}

open class Middleware: MiddlewareProtocol {
    public var ctx: Any?
    public var next: MiddlewareProtocol?
    
    open func execute() {}
    
    public init() { }
}

open class MiddlewareCenter {
    private var middlewares = [Middleware]()
    
    public init() { }
    
    @discardableResult
    open func use(_ middleware: Middleware) -> MiddlewareCenter {
        middlewares.append(middleware)
        if middlewares.count > 1 {
            middlewares[middlewares.count-2].next = middleware
        }
        return self
    }
    
    open func handle(ctx: Any?) {
        next(ctx: ctx)
    }
    
    private func next(ctx: Any?) {
        if let first = middlewares.first {
            first.ctx = ctx
            first.execute()
            middlewares.removeFirst()
        }
    }
}
