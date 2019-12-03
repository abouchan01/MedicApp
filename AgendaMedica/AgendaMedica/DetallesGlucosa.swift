//
//  DetallesGlucosa.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/29/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class DetallesGlucosa: UIViewController {

        var datosG : Glucosa?
        
        @IBOutlet weak var fechaGlucosaL: UILabel!
        @IBOutlet weak var horaGlucosaL: UILabel!
        @IBOutlet weak var nivelGlucosaL : UILabel!
        @IBOutlet weak var alimentosL : UILabel!
        @IBOutlet weak var ejercicioL : UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            fechaGlucosaL.text = datosG?.fechaGlucosa
            horaGlucosaL.text = datosG?.horaGlucosa
            nivelGlucosaL.text = datosG?.glucosa
            alimentosL.text = datosG?.alimentos
            ejercicioL.text = datosG?.ejercicio
        }


}
