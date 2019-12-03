//
//  PresionArterial.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 16 on 11/27/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit


class PresionArterial: UIViewController{
   
    @IBOutlet weak var fechaPresionTF: UITextField!
    @IBOutlet weak var horaPresionTF: UITextField!
    @IBOutlet weak var sistoleTF: UITextField!
    @IBOutlet weak var diastoleTF: UITextField!
    @IBOutlet weak var observacionesTF: UITextField!
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        showTimePicker()
    }
    //Estas funciones son para la fecha
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

         fechaPresionTF.inputAccessoryView = toolbar
         fechaPresionTF.inputView = datePicker
    }
    @objc func donedatePicker(){
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      fechaPresionTF.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    //Estas funciones son para la hora
    func showTimePicker(){
        timePicker.datePickerMode = .time
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donetimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelTimePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

         horaPresionTF.inputAccessoryView = toolbar
         horaPresionTF.inputView = timePicker
    }
    @objc func donetimePicker(){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        horaPresionTF.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelTimePicker(){
       self.view.endEditing(true)
     }
    
    //Botones que estan en el UI
    @IBAction func agregarRegistroPA(_ sender: Any) {
        if fechaPresionTF.text == "" || horaPresionTF.text == "" || sistoleTF.text == "" || diastoleTF.text == "" {
            let alerta = UIAlertController (title: "Alerta", message: "Ingrese todos los datos importantes", preferredStyle: .alert)
            let mensaje = UIAlertAction (title: "Continuar", style: .default)
            alerta.addAction(mensaje)
            self.present ( alerta, animated: true, completion: nil)
        } else {
            let nuevaPresion = Presiones (fechaPresion : fechaPresionTF.text!, horaPresion : horaPresionTF.text!, sistole : sistoleTF.text!, diastole: diastoleTF.text!, observaciones: observacionesTF.text!)
            
            Presiones.registros.append(nuevaPresion)
            
            fechaPresionTF.text = ""
            horaPresionTF.text = ""
            sistoleTF.text = ""
            diastoleTF.text = ""
            observacionesTF.text = ""
            /*
             var fechaPresion : String
             var horaPresion : String
             var sistole : String
             var diastole : String
             var observaciones : String
             
             */
            let aviso = UIAlertController (title: "Aviso", message: "El registro ha sido agregado", preferredStyle: .alert)
            let sennal = UIAlertAction (title: "Continuar", style: .default)
            aviso.addAction(sennal)
            self.present ( aviso, animated: true, completion: nil)
        }
    }
    @IBAction func registros(_ sender: Any) {
    }
    
}

