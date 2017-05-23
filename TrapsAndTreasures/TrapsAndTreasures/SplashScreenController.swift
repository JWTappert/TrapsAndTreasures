//
//  SplashScreenController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/22/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit
import PusherSwift

class SplashScreenController: UIViewController {
    
    //MARK: Properties
    
    let pusher = Pusher(
        key: "66e3fc270b543534a225",
        options: PusherClientOptions(host: .cluster("us2"))
    )

    override func viewDidLoad() {
        
        
        // subscribe to channel and bind to event
        let channel = pusher.subscribe("my-channel")
        
        let _ = channel.bind(eventName: "my-event", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                if let message = data["message"] as? String {
                    print(message)
                }
            }
        })
        
        pusher.connect()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func splashButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "splashSegue", sender: nil)
    }
    
}
