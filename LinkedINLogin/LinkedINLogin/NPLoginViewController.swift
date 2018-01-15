//
//  NPLoginViewController.swift
//  LinkedINLogin
//
//  Created by Nouman Pervez on 16/01/18.
//  Copyright © 2018 Nouman Pervez. All rights reserved.
//

import UIKit

import LinkedinSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NPLoginViewController: UIViewController, NPLinkedInParserDelegate {
    
    @IBAction func Action_loggedInLinkedIN(_ sender: UIButton) {
        
        let linkedInParse = NPLinkedInParser()
        linkedInParse.delegate = self 
    }
    
    // MARK: - Linkedin Parser Delegate
    
    func linkedInParsingCompleted(_ obj: NPLinkedInParser) {
        
        if (obj.error == nil){
            print(obj)
        }
        else{
            print(obj.error)
        }
    }
}
