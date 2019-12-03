//
//  FichaPesoUI.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 18 on 12/2/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class FichaPesoUI: UIViewController {
    @IBOutlet weak var pesoMetaTF: UITextField!
    @IBOutlet weak var pesoInicialTF: UITextField!
    @IBOutlet weak var alturaTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Botones que estan en el UI
    @IBAction func agregarRegistroPeso(_ sender: Any) {
        if pesoMetaTF.text == "" || pesoInicialTF.text == "" || alturaTF.text == ""{
            let alerta = UIAlertController (title: "Alerta", message: "Ingrese todos los datos", preferredStyle: .alert)
            let mensaje = UIAlertAction (title: "Continuar", style: .default)
            alerta.addAction(mensaje)
            self.present ( alerta, animated: true, completion: nil)
        } else {
         let nuevaFichaPeso = FichaPeso (pesoMeta : pesoMetaTF.text!, pesoInicial : pesoInicialTF.text!, altura : alturaTF.text!)
            
            FichaPeso.ficha.append(nuevaFichaPeso)
            
            pesoMetaTF.text = ""
            pesoInicialTF.text = ""
            alturaTF.text = ""


            let aviso = UIAlertController (title: "Aviso", message: "El registro ha sido agregado", preferredStyle: .alert)
            let sennal = UIAlertAction (title: "Continuar", style: .default)
            aviso.addAction(sennal)
            self.present ( aviso, animated: true, completion: nil)
        }
    }

}
