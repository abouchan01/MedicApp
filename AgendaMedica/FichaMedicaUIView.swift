//
//  FichaMedicaUIView.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 17 on 11/21/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit

class FichaMedicaUIView: UIViewController{
    var datos : datosDeFicha?
    @IBOutlet weak var nombrePacienteL: UILabel!
    @IBOutlet weak var edadPacienteL: UILabel!
    @IBOutlet weak var sexoPacienteL: UILabel!
    @IBOutlet weak var tipoSangrePacienteL: UILabel!
    @IBOutlet weak var alergiasPacienteL: UILabel!
    @IBOutlet weak var nombreEmergenciasL: UILabel!
    
    @IBOutlet weak var botonNumero: UIButton!
    
    
    
    var nombre = ""
    var edad = ""
    var sexo = "tghj"
    var Tsangre = ""
    var alergias = ""
    var Ncontacto = ""
    var telContacto = ""
    
    
     override func viewDidLoad() {
            super.viewDidLoad()
            nombrePacienteL.text = nombre
            edadPacienteL.text = edad
            sexoPacienteL.text = sexo
            tipoSangrePacienteL.text = Tsangre
            alergiasPacienteL.text = alergias
            nombreEmergenciasL.text = Ncontacto
        botonNumero.setTitle(telContacto, for: .normal)
           
        }
           
    
    
    @IBAction func llamadaEmergencia(_ sender: UIButton) {
        guard let numeroString = sender.titleLabel?.text,let url = URL(string: "telprompt://\(numeroString)") else{
            return
        }
        
        UIApplication.shared.open(url)
        
        
    }
   
    
    @IBAction func compartir(_ sender: Any) {
        
        let fileName = "FichaMedica\(nombre)"
           let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
           
           let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
           print("FilePath: \(fileURL.path)")
           
           let writeString = "Tu ficha medica generada es: \n Nombre: \(nombre) \n Edad: \(edad) \n Sexo: \(sexo) \n Tipo de sangre: \(Tsangre) \n Alergias: \(alergias) \n En caso de emergencia se debe llamar a: \(Ncontacto) con numero de telefono: \(telContacto)"
           do {
               // Write to the file
               try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
           } catch let error as NSError {
               print("Escritura fallida URL: \(fileURL), Error: " + error.localizedDescription)
           }
        
           var readString = "" // Used to store the file contents
           do {
               // Read the file contents
               readString = try String(contentsOf: fileURL)
           } catch let error as NSError {
               print("Fallo leyendo de URL: \(fileURL), Error: " + error.localizedDescription)
           }
           print("File Text: \(readString)")

        
        let actividad = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        actividad.popoverPresentationController?.sourceView = self.view
        
        self.present(actividad, animated: true, completion: nil)
        
    }
    
    
}
