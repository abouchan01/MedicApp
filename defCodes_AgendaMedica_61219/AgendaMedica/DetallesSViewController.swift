//
//  DetallesSViewController.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/29/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//
import UIKit

class DetallesSViewController: UIViewController {

  var datosS : Sentimientos?
  
    @IBOutlet weak var fechaSL: UILabel!
    @IBOutlet weak var sentimientoSL: UILabel!
    @IBOutlet weak var detallesSL: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
        fechaSL.text = datosS?.fechaSentimientos
        sentimientoSL.text = datosS?.emocion
        detallesSL.text = datosS?.observacionesSentimientos
  }

}
