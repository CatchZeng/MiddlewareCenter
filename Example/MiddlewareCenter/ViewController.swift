//
//  ViewController.swift
//  MiddlewareCenter
//
//  Created by catchzeng on 09/07/2018.
//  Copyright (c) 2018 catchzeng. All rights reserved.
//

import UIKit
import MiddlewareCenter

class ViewController: UIViewController {
    
    let center = MiddlewareCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.use(BeforeUpload())
        center.use(StartUpload())
        center.use(EndUpload())
        
        center.handle(ctx: nil)
    }
}

public class StartUpload: Middleware {
    public override func execute() {
        print("before StartUpload.")
        next?.execute()
        print("after StartUpload.")
    }
}

public class BeforeUpload: Middleware {
    public override func execute() {
        print("before upload.")
        next?.execute()
        print("after upload.")
    }
}

public class EndUpload: Middleware {
    public override func execute() {
        print("before EndUpload.")
        next?.execute()
        print("after EndUpload.")
    }
}
