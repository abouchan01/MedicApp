//
//  VideoController.swift
//  AgendaMedica
//
//  Created by Abraham Bouchan on 02/12/19.
//  Copyright © 2019 DefCodes. All rights reserved.
//

import UIKit
import AVKit

class VideoController: UIViewController {

    
    @IBAction func presentacionVideo(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "lavadoManos", ofType: "MOV")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
        }
    }
    
   /* @IBAction func materialesVid(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "materialinyeccion", ofType: "MOV")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
        }
    }
    
    
    @IBAction func primeraInyVid(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "inyeccion1", ofType: "MOV")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
        }
    }
    
    
    @IBAction func SegundaInyVid(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "inyeccion2", ofType: "MOV")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
        }
    }
    
    
    
    
    
    
    
    
    
    @IBAction func LavadoManosVid(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "presentacion", ofType: "MOV")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
            })
        }
    }
    */
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
