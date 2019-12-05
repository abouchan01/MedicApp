//
//  PesoUI.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 18 on 12/2/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class PesoUI: UIViewController {
    
    @IBOutlet weak var fechaPesoTF: UITextField!
    @IBOutlet weak var pesoRegistroTF: UITextField!
    @IBOutlet weak var observacionesPesoTF: UITextField!

       let datePickerPeso = UIDatePicker()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           showDatePicker()
       }
       //Estas funciones son para la fecha
       func showDatePicker(){
           //Formate Date
           datePickerPeso.datePickerMode = .date
           //ToolBar
           let toolbar = UIToolbar();
           toolbar.sizeToFit()
           let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donedatePicker));
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
           let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));

           toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

           fechaPesoTF.inputAccessoryView = toolbar
           fechaPesoTF.inputView = datePickerPeso
       }
       @objc func donedatePicker(){
         let formatter = DateFormatter()
         formatter.dateFormat = "dd/MM/yyyy"
         fechaPesoTF.text = formatter.string(from: datePickerPeso.date)
         self.view.endEditing(true)
       }
       @objc func cancelDatePicker(){
          self.view.endEditing(true)
        }
       
    //Botones que estan en el UI
       @IBAction func agregarRegistroPeso(_ sender: Any) {
           if fechaPesoTF.text == "" || pesoRegistroTF.text == "" || observacionesPesoTF.text == ""{
               let alerta = UIAlertController (title: "Alerta", message: "Ingrese todos los datos", preferredStyle: .alert)
               let mensaje = UIAlertAction (title: "Continuar", style: .default)
               alerta.addAction(mensaje)
               self.present ( alerta, animated: true, completion: nil)
           } else {
            let nuevoRegistroPeso = Peso (observacionesPeso : observacionesPesoTF.text!, fechaPeso : fechaPesoTF.text!, pesoP : pesoRegistroTF.text!)
               
               Peso.registrosP.append(nuevoRegistroPeso)
               
               fechaPesoTF.text = ""
               pesoRegistroTF.text = ""
               observacionesPesoTF.text = ""


               let aviso = UIAlertController (title: "Aviso", message: "El registro ha sido agregado", preferredStyle: .alert)
               let sennal = UIAlertAction (title: "Continuar", style: .default)
               aviso.addAction(sennal)
               self.present ( aviso, animated: true, completion: nil)
           }
       }

}
