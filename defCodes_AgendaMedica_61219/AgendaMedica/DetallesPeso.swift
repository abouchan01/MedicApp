//
//  Detalles.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 18 on 12/2/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class DetallesPeso: UIViewController {
    
    var datosFicha : FichaPeso?
    var datosPeso : Peso?
    
    @IBOutlet weak var fechaPesoL: UILabel!
    @IBOutlet weak var pesoRegistroL : UILabel!
    @IBOutlet weak var pesoMetaL : UILabel!
    @IBOutlet weak var pesoInicialL : UILabel!
    @IBOutlet weak var ObservacionesPesoL : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fechaPesoL.text = datosPeso?.fechaPeso
        pesoRegistroL.text = datosPeso?.pesoP
        pesoMetaL.text = datosFicha?.pesoMeta
        pesoInicialL.text = datosFicha?.pesoInicial
        ObservacionesPesoL.text = datosPeso?.observacionesPeso
    }

}
