//
//  SentimientosUI.swift
//  AgendaMedica
//
//  Created by Abraham Bouchan
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class SentimientosUI: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var sentimientoTFP: UITextField!
    @IBOutlet weak var fechaSentimientosTF: UITextField!
    @IBOutlet weak var observacionesSentimientosTF: UITextField!
    let datePickerS = UIDatePicker()
    
    var pickSentimientos = ["Ninguna de las del menú", "Enojado", "Alegría", "Miedo", "Confianza", "Sorpresa", "Tristeza", "Remordimiento", "Sorpresa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        sentimientoTFP.inputView = pickerView
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickSentimientos.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickSentimientos[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sentimientoTFP.text = pickSentimientos[row]
    }
    //Estas funciones son para la fecha
    func showDatePicker(){
        //Formate Date
        datePickerS.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        fechaSentimientosTF.inputAccessoryView = toolbar
        fechaSentimientosTF.inputView = datePickerS
    }
    @objc func donedatePicker(){
      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      fechaSentimientosTF.text = formatter.string(from: datePickerS.date)
      self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    //Botones que estan en el UI
    @IBAction func agregarRegistroG(_ sender: Any) {
        if fechaSentimientosTF.text == "", observacionesSentimientosTF.text == "" {
            let alerta = UIAlertController (title: "Alerta", message: "Ingrese todos los datos", preferredStyle: .alert)
            let mensaje = UIAlertAction (title: "Continuar", style: .default)
            alerta.addAction(mensaje)
            self.present ( alerta, animated: true, completion: nil)
        } else {
            let nuevoRegistroS = Sentimientos (observacionesSentimientos: observacionesSentimientosTF.text!, fechaSentimientos: fechaSentimientosTF.text!, emocion: sentimientoTFP.text!)
            
            Sentimientos.registrosS.append(nuevoRegistroS)
            
            fechaSentimientosTF.text = ""
            observacionesSentimientosTF.text = ""
            sentimientoTFP.text = ""


            let aviso = UIAlertController (title: "Aviso", message: "El registro ha sido agregado", preferredStyle: .alert)
            let sennal = UIAlertAction (title: "Continuar", style: .default)
            aviso.addAction(sennal)
            self.present ( aviso, animated: true, completion: nil)
        }
    }

}
