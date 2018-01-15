//
//  NPLinkedInParser.swift
//  LinkedINLogin
//
//  Created by NOUMAN PERVEZ on 16/01/18.
//  Copyright © 2018 Ratheesh Mac Mini. All rights reserved.
//

import UIKit
import LinkedinSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol NPLinkedInParserDelegate: class {
    
    func linkedInParsingCompleted(_ obj: NPLinkedInParser) -> Void
}

class NPLinkedInParser: NSObject {

    public var emailID : String!
    public var LName : String!
    public var FName : String!
    public var linkedInID : String!
    public var location : NSDictionary!
    public var pictureUrls : NSDictionary!
    public var positions : NSDictionary!
    public var error : Error!
    
    public weak var delegate : NPLinkedInParserDelegate?
    
    
    override init() {
        
        super.init()
        self.getLinkedData()
        return
    }
    
    func getLinkedData() -> Void {
        
        let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId:"YOUR CLIENT ID", clientSecret: "YOUR CLIENT SECRET KEY", state: "YOU ADMIN KEY", permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "YOUR REDIRECT URL"))
        
        linkedinHelper.authorizeSuccess({ (token) in
            print(token)
            //This token is useful for fetching profile info from LinkedIn server
            linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address,picture-url,picture-urls::(original),positions,date-of-birth,phone-numbers,location)?format=json", requestType: LinkedinSwiftRequestGet, success: { (response) -> Void in
                
                self.parseLinkedInResponse(response)
                //parse this response which is in the JSON format
            }) {(error) -> Void in
                self.error = error
                print(error.localizedDescription)
                //handle the error
                self.delegate?.linkedInParsingCompleted(self)
            }
        }, error: { (error) in
            
            self.error = error
            print(error.localizedDescription)
            //show respective error
            self.delegate?.linkedInParsingCompleted(self)
        })
    }
    
    func parseLinkedInResponse(_ response: LSResponse) -> Void {
        
        if let email = response.jsonObject["emailAddress"] {
            self.emailID = email as! String
        }
        else{
            self.emailID = ""
        }
        if let name = response.jsonObject["id"]{
            self.linkedInID = name as! String
        }
        else{
            self.linkedInID = ""
        }
        if let fName = response.jsonObject["firstName"]{
            self.FName = fName as! String
        }
        else{
            self.FName = ""
        }
        if let lName = response.jsonObject["lastName"]{
            self.LName = lName as! String
        }
        else{
            self.LName = ""
        }
        if let location = response.jsonObject["location"]{
            self.location = location as! NSDictionary
        }
        else{
            self.location = [:]
        }
        if let picture = response.jsonObject["pictureUrls"]{
            self.pictureUrls = picture as! NSDictionary
        }
        else{
            self.pictureUrls = [:]
        }
        if let positions = response.jsonObject["positions"]{
            self.positions = positions as! NSDictionary
        }
        else{
            self.positions = [:]
        }
        self.error = nil
        //calls delegate and sends backs to Viewcontroller
        self.delegate?.linkedInParsingCompleted(self)
    }
}
