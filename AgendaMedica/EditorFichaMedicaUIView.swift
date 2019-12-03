//
//  EditorFichaMedica.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/26/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//
//  En éste archivo es para guardar las variables de la ficha médica
//  y para controlar las funciones del UI Editor de la misma

import UIKit

class EditorFichaMedica: UIViewController{
    
    @IBOutlet weak var nombrePacienteTF: UITextField!
    @IBOutlet weak var edadPacienteTF: UITextField!
    @IBOutlet weak var sexoPacienteTF: UITextField!
    @IBOutlet weak var tipoSangrePacienteTF: UITextField!
    @IBOutlet weak var alergiasPacienteTF: UITextField!
    @IBOutlet weak var nombreEmergenciasTF: UITextField!
    @IBOutlet weak var telefonoEmergenciasTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fichaMedica = segue.destination as! FichaMedicaUIView
        fichaMedica.nombre = nombrePacienteTF.text!
        fichaMedica.edad = edadPacienteTF.text!
        fichaMedica.sexo = sexoPacienteTF.text!
        
        fichaMedica.Tsangre = tipoSangrePacienteTF.text!
        fichaMedica.alergias = alergiasPacienteTF.text!
        fichaMedica.Ncontacto = nombreEmergenciasTF.text!
        fichaMedica.telContacto = telefonoEmergenciasTF.text!
        
        
        
    }
    
    
    
    //ésta acción esta ligada con el botón de guardar
    @IBAction func agregarB(_ sender: Any) {
        //En caso de que falte un dato, no se va a guardar y lanzara un cuadro de advertencia
        if nombrePacienteTF.text == "" || edadPacienteTF.text == "" || sexoPacienteTF.text == "" || tipoSangrePacienteTF.text == "" || alergiasPacienteTF.text == "" || nombreEmergenciasTF.text == "" || telefonoEmergenciasTF.text == ""{
            let alerta = UIAlertController (title: "Advertencia", message: "Ingrese todos los datos", preferredStyle: .alert)
            let mensaje = UIAlertAction (title: "Continuar", style: .default)
            alerta.addAction(mensaje)
            self.present ( alerta, animated: true, completion: nil)
        }else {
            return
        }
    }
  
    
    
    
    @IBAction func EsconderAlergias(_ sender: Any) {
         self.resignFirstResponder()
    }
    
    @IBAction func EsconderNombre(_ sender: Any) {
         self.resignFirstResponder()
    }
    
    @IBAction func EsconderSexo(_ sender: Any) {
         self.resignFirstResponder()
    }
    
    
    
    @IBAction func EsconderTipoSangre(_ sender: Any) {
         self.resignFirstResponder()
    }
    
    
    @IBAction func EsconderTelefono(_ sender: Any) {
         self.resignFirstResponder()
    }
    
    
    @IBAction func EsconderNContacto(_ sender: Any) {
         self.resignFirstResponder()
    }
    
}
