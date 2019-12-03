//
//  DetallesPresion.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/28/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//
import UIKit

class DetallesPresion: UIViewController {
    var datos : Presiones?
    
    @IBOutlet weak var fechaPresionL: UILabel!
    @IBOutlet weak var horaPresionL: UILabel!
    @IBOutlet weak var sistoleL : UILabel!
    @IBOutlet weak var diastoleL : UILabel!
    @IBOutlet weak var observacionesL : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fechaPresionL.text = datos?.fechaPresion
        horaPresionL.text = datos?.horaPresion
        sistoleL.text = datos?.sistole
        diastoleL.text = datos?.diastole
        observacionesL.text = datos?.observaciones
    }
}
