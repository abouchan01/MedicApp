//
//  GlucosaUI.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/29/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class GlucosaUI: UIViewController {
    @IBOutlet weak var fechaGlucosaTF: UITextField!
    @IBOutlet weak var horaGlucosaTF: UITextField!
    @IBOutlet weak var nivelGlucosaTF: UITextField!
    @IBOutlet weak var alimentosTF: UITextField!
    @IBOutlet weak var ejercicioTF: UITextField!
    
    let datePickerG = UIDatePicker()
    let timePickerG = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        showTimePicker()
    }
    //Estas funciones son para la fecha
    func showDatePicker(){
        //Formate Date
        datePickerG.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        fechaGlucosaTF.inputAccessoryView = toolbar
        fechaGlucosaTF.inputView = datePickerG
    }
    @objc func donedatePicker(){
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      fechaGlucosaTF.text = formatter.string(from: datePickerG.date)
      self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    
    //Estas funciones son para la hora
    func showTimePicker(){
        timePickerG.datePickerMode = .time
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donetimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelTimePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

         horaGlucosaTF.inputAccessoryView = toolbar
         horaGlucosaTF.inputView = timePickerG
    }
    @objc func donetimePicker(){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        horaGlucosaTF.text = formatter.string(from: timePickerG.date)
        self.view.endEditing(true)
    }
    @objc func cancelTimePicker(){
       self.view.endEditing(true)
     }
    
    //Botones que estan en el UI
    @IBAction func agregarRegistroG(_ sender: Any) {
        if fechaGlucosaTF.text == "" || horaGlucosaTF.text == "" || nivelGlucosaTF.text == "" || alimentosTF.text == "", ejercicioTF.text == ""{
            let alerta = UIAlertController (title: "Alerta", message: "Ingrese todos los datos", preferredStyle: .alert)
            let mensaje = UIAlertAction (title: "Continuar", style: .default)
            alerta.addAction(mensaje)
            self.present ( alerta, animated: true, completion: nil)
        } else {
            let nuevoRegistroG = Glucosa (fechaGlucosa : fechaGlucosaTF.text!, horaGlucosa : horaGlucosaTF.text!, glucosa : nivelGlucosaTF.text!, alimentos: alimentosTF.text!, ejercicio: ejercicioTF.text!)
            
            Glucosa.registrosG.append(nuevoRegistroG)
            
            fechaGlucosaTF.text = ""
            horaGlucosaTF.text = ""
            nivelGlucosaTF.text = ""
            alimentosTF.text = ""
            ejercicioTF.text = ""

            let aviso = UIAlertController (title: "Aviso", message: "El registro ha sido agregado", preferredStyle: .alert)
            let sennal = UIAlertAction (title: "Continuar", style: .default)
            aviso.addAction(sennal)
            self.present ( aviso, animated: true, completion: nil)
        }
    }
}
