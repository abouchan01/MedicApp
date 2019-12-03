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
  
  @IBOutlet weak var fechaSentimientosL: UILabel!
  @IBOutlet weak var emocionL: UILabel!
  @IBOutlet weak var observacionesL : UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fechaSentimientosL.text = datosS?.fechaSentimientos
    emocionL.text = datosS?.emocion
    observacionesL.text = datosS?.observacionesSentimientos
  }

}