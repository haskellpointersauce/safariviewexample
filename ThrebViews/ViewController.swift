//
//  ViewController.swift
//  ThrebViews
//
//  Created by Kyle Pointer on 06.01.20.
//  Copyright © 2020 Kyle Pointer. All rights reserved.
//

import UIKit
import WebKit
import SafariServices
import AuthenticationServices

class ViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return self.view!.window!
    }
    
    var authSession : ASWebAuthenticationSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thePlaceYouReallyWantToBe = URL(string:"https://www.duckduckgo.com")!
        
        authSession = ASWebAuthenticationSession(url: thePlaceYouReallyWantToBe, callbackURLScheme: nil) { (a, b) in
            print(a)
            print(b)
        }
        
        //let safariViewController = SFSafariViewController(url: thePlaceYouReallyWantToBe)
        
        //        super.present(safariViewController, animated: true) {
        //            print("presented")
        //        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if #available(iOS 13.0, *) {
            authSession.presentationContextProvider = self
        } else {
            // Fallback on earlier versions
        }
        authSession.start()
    }
}

