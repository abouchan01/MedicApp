
//
//  GameScene.swift
//  Flypi Fly
//
//  Created by Juan on.
//  Copyright ©Juan. All rights reserved.
//
import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var mosca = SKSpriteNode()
    var fondo = SKSpriteNode()
    var tubo1 = SKSpriteNode()
    var tubo2 = SKSpriteNode()
    
    var texturaMosca1 = SKTexture()
    var labelPuntuacion =  SKLabelNode()
    var puntuacion = 0
    var timer = Timer()
    var gameOver = false
    
    
    /*
     
    La propiedad categoryBitMask es un número que define el tipo de objeto que el cuerpo fisico del nodo tendrá y es considerado para las colisiones y contactos.
     
    La propiedad collisionBitMask es un número que define con cuales categorias de objetos este nodo deberia colisionar.
    
    La propiedad contactTestBitMask es un número que define cueles colisiones nos seran notificadas.
    
    Nota:
     
     Si le das a un nodo numeros de Collision Bitmask pero no les das numeros de contact test Bitmask, significa que los nodos podran colisionar pero no tendras manera de saber cuando ocurrio en código (no se notificara al sistema).
     
     Si haces lo contrario (no Collision Bitmask pero si Contact Test Bitmask), no "chocaran" o colisionaran, pero el sistema te podra notificar el momento en que tuvieron contacto.
         
     Si a las dos propiedades les das valores entonces notificado y a su vez los nodos podran colisionar.
     
     Automaticamente los cuerpos fisicos tienen su propiedad de Collision Bitmask = a TODO y su Contact Bitmask = Nada */
  
    enum tipoNodo: UInt32 {
    
    case mosca = 1
        
    case tuboSuelo = 2
        
    case espacioTubos = 4
    
    }
    
    
    override func didMove(to view: SKView) {
        
        
        self.physicsWorld.contactDelegate = self
        
        reiniciar()
        
    }
    
    
    func añadirLabelPuntuacion(){
    
    labelPuntuacion.fontName = "04b_19"
    labelPuntuacion.fontSize = 80
    labelPuntuacion.text = "0"
    labelPuntuacion.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 500)
    labelPuntuacion.zPosition = 2
    self.addChild(labelPuntuacion)
    
    
    
    }
    
    
    
    func añadirMosca(){
        
        texturaMosca1 = SKTexture(imageNamed:"fly1.png")
        let texturaMosca2 = SKTexture(imageNamed:"fly2.png")
        let animacion = SKAction.animate(with:[texturaMosca1,texturaMosca2],timePerFrame: 0.08)
        
        let animacionInfinita = SKAction.repeatForever(animacion)
        
        mosca = SKSpriteNode(texture:texturaMosca1)
        
        mosca.position = CGPoint(x:self.frame.midX , y:self.frame.midY )
        
        mosca.physicsBody = SKPhysicsBody(circleOfRadius:texturaMosca1.size().height/2)
        
        
        mosca.physicsBody!.isDynamic = false
        
        
        mosca.physicsBody!.categoryBitMask = tipoNodo.mosca.rawValue
        mosca.physicsBody!.collisionBitMask = tipoNodo.tuboSuelo.rawValue
        mosca.physicsBody!.contactTestBitMask = tipoNodo.tuboSuelo.rawValue | tipoNodo.espacioTubos.rawValue
        
        mosca.run(animacionInfinita)
        
        mosca.zPosition = 1
        
        self.addChild(mosca)
        
    }
    
    //NODOS
    
    func añadirFondo(){
    
        
        let texturaFondo = SKTexture(imageNamed:"fondo.png")
        
        let movimientoFondo = SKAction.move(by: CGVector(dx: -texturaFondo.size().width, dy:0), duration:4)
        
        let movimientoFondoOrigen = SKAction.move(by: CGVector(dx: texturaFondo.size().width, dy:0), duration:0)
        
        let movimientoInfinitoFondo = SKAction.repeatForever(SKAction.sequence([movimientoFondo,movimientoFondoOrigen]))
        
        var i:CGFloat = 0
        
        while i < 2 {
            
            fondo = SKSpriteNode(texture:texturaFondo)
            
            fondo.position = CGPoint(x:texturaFondo.size().width * i, y: self.frame.midY)
            
            fondo.size.height = self.frame.height
            
            fondo.zPosition = -1
            
            fondo.run(movimientoInfinitoFondo)
            
            self.addChild(fondo)
            
            i += 1
            }
    
    }
    
    func añadirSuelo(){
        
        let suelo = SKNode()
        
        suelo.position = CGPoint(x:-self.frame.midX, y:-self.frame.height/2)
        
        suelo.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:self.frame.width, height:1))
        
        suelo.physicsBody!.isDynamic = false
        
        suelo.physicsBody!.categoryBitMask = tipoNodo.tuboSuelo.rawValue
        suelo.physicsBody!.collisionBitMask = tipoNodo.mosca.rawValue
        suelo.physicsBody!.contactTestBitMask = tipoNodo.mosca.rawValue
        
        self.addChild(suelo)
        
    }
    
    @objc func añadirTubosEspacios(){
        
        let moverTubos = SKAction.move(by: CGVector(dx: -3 * self.frame.width, dy: 0), duration: TimeInterval(self.frame.width / 80))
        
        let removerTubos = SKAction.removeFromParent()
        
        let moverRemoverTubos = SKAction.sequence([moverTubos,removerTubos])
        
        
        let gapDificultad = mosca.size.height * 3
        //print(gapDificultad)
        // Numero entre cero y la mitad del alto de la pantalla
        let cantidadMovimientoAleatorio = CGFloat(arc4random() % UInt32(self.frame.height/2))
        
        
        let compensacionTubos =  cantidadMovimientoAleatorio - self.frame.height / 4
        
        let texturaTubo1 = SKTexture(imageNamed:"Tubo1.png")
        tubo1 = SKSpriteNode(texture:texturaTubo1)
        tubo1.position = CGPoint(x:self.frame.midX + self.frame.width, y:self.frame.midY + texturaTubo1.size().height / 2 + gapDificultad + compensacionTubos)
        tubo1.zPosition = 0
        
        tubo1.physicsBody = SKPhysicsBody(rectangleOf:texturaTubo1.size() )
        tubo1.physicsBody!.isDynamic = false
        
        tubo1.physicsBody!.categoryBitMask = tipoNodo.tuboSuelo.rawValue
        tubo1.physicsBody!.collisionBitMask = tipoNodo.mosca.rawValue
        tubo1.physicsBody!.contactTestBitMask = tipoNodo.mosca.rawValue
        
        tubo1.run(moverRemoverTubos)
        
        self.addChild(tubo1)
        
        let texturaTubo2 = SKTexture(imageNamed:"Tubo2.png")
        tubo2 = SKSpriteNode(texture:texturaTubo2)
        tubo2.position = CGPoint(x:self.frame.midX + self.frame.width, y:self.frame.midY - texturaTubo2.size().height / 2 - gapDificultad + compensacionTubos)
        tubo2.zPosition = 0
        tubo2.physicsBody = SKPhysicsBody(rectangleOf:texturaTubo1.size() )
        tubo2.physicsBody!.isDynamic = false
        
        tubo2.physicsBody!.categoryBitMask = tipoNodo.tuboSuelo.rawValue
        tubo2.physicsBody!.collisionBitMask = tipoNodo.mosca.rawValue
        tubo2.physicsBody!.contactTestBitMask = tipoNodo.mosca.rawValue
        
        tubo2.run(moverRemoverTubos)
        
        self.addChild(tubo2)
        
        //Espacios
        
        
        let  doc = SKTexture(imageNamed:"doc.png")
        
        let espacio = SKSpriteNode(texture:doc)
        
        espacio.position = CGPoint(x:self.frame.midX + self.frame.width , y:self.frame.midY + compensacionTubos)
        
        espacio.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:texturaTubo1.size().width , height: mosca.size.height * 3))
        
        espacio.physicsBody!.isDynamic = false
        espacio.zPosition = 1
        
        espacio.physicsBody!.categoryBitMask = tipoNodo.espacioTubos.rawValue
        espacio.physicsBody!.collisionBitMask = 0
        espacio.physicsBody!.contactTestBitMask = tipoNodo.mosca.rawValue
        
        
        espacio.run(moverRemoverTubos)
        
        
        self.addChild(espacio)
        
  
    }
    
 
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if gameOver == false{
        
        mosca.physicsBody!.isDynamic = true
        
        mosca.physicsBody!.velocity = (CGVector(dx: 0 , dy: 0) )
        
        mosca.physicsBody!.applyImpulse(CGVector(dx: 0 , dy: 100) )
        
        }else{
        
        gameOver = false
        
        puntuacion = 0
            
        self.speed = 1
        
        self.removeAllChildren()
            
        reiniciar()
        
        
        }
        
        
        
    }
    
    
    func reiniciar(){
    
        //Timer Tubos
        
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.añadirTubosEspacios), userInfo: nil, repeats: true)
        
        //Label Puntuacion
        
        añadirLabelPuntuacion()
        
        //MOSCA
        
        añadirMosca()
        
        //FONDO
        
        añadirFondo()
        
        //Suelo
        
        añadirSuelo()
        
        //TUBOS //Espacio entre tubos
        
        añadirTubosEspacios()
    
    
    
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let cuerpoA = contact.bodyA
        let cuerpoB = contact.bodyB
        
        
        if (cuerpoA.categoryBitMask == tipoNodo.mosca.rawValue && cuerpoB.categoryBitMask == tipoNodo.espacioTubos.rawValue ) || (cuerpoA.categoryBitMask == tipoNodo.espacioTubos.rawValue && cuerpoB.categoryBitMask == tipoNodo.mosca.rawValue ) {
        
      
            
        puntuacion += 1
            
        labelPuntuacion.text = String(puntuacion)
            
        
        }else{
        
        
        gameOver = true
            
        self.speed = 0
         
        timer.invalidate()
        
        labelPuntuacion.text = "Game Over"
        
        
        
        }
        
    }
    
 
 
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
 
 
}
