//
//  File.swift
//  AgendaMedica
//
//  Created by Laboratorio UNAM-Apple 16 on 11/27/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//
//  Éste archivo es para guardar los datos de la ficha médica

import Foundation

struct datosDeFicha {
    var nombrePaciente : String
    var edadPaciente : String
    var sexoPaciente : String
    var tipoSangrePaciente : String
    var alergiasPaciente : String
    var nombreEmergencias : String
    var telefonoEmergencias : String
    
    static var datos = [datosDeFicha] ()
}


