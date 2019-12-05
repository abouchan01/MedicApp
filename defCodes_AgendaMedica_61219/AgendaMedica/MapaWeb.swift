//
//  MapaWeb.swift
//  AgendaMedica
//
//  Created by Abraham Bouchan on 22/11/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit
import WebKit
import CoreLocation

final class MapaWeb: UIViewController {
    
    
    
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK.- localizacion
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() 
        
        
        //Pagina web
        
        let webViewPref =  WKPreferences()
        webViewPref.javaScriptEnabled = true
        webViewPref.javaScriptCanOpenWindowsAutomatically = true
        let webViewConf = WKWebViewConfiguration()
        webViewConf.preferences = webViewPref
        
        webView = WKWebView(frame: view.frame, configuration: webViewConf)
        webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.addSubview(webView)
        load(url: "https://datos.cdmx.gob.mx/explore/dataset/hospitales-y-centros-de-salud/map/?location=10,19.36945,-99.14886")
    }
        
        func load(url: String){
            webView.load(URLRequest(url: URL(string: url)!))
        }

  
   
}




extension MapaWeb: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //regresare
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            //regresar
    }
}
