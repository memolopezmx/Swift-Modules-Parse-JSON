//
//  ViewController.swift
//  REST
//
//  Created by ginppian on 10/05/17.
//  Copyright © 2017 Nut Systems. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var activity: UIActivityIndicatorView!
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        ]
    
    let params : Parameters = ["token": "c31e7cc5503e222a6d2ab594c845730272273a5bdcdbd1b97e29df7e19b3ecdadf021fe6a05a0da5c7046e670d89365181d15d037262822231735da484398578"]
    
    let url = "https://offercity.herokuapp.com/api/mostrarEstablecimiento"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(self.url, method: .post, parameters: self.params, encoding: URLEncoding.httpBody, headers: self.headers)
            
            .responseJSON(completionHandler: { response in
                
                //Deserealizacion
                let swiftyJson = JSON(response.result.value!)
                print("swiftyJson: \(swiftyJson)")
                
            })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

