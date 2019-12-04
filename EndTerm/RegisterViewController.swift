//
//  RegisterViewController.swift
//  EndTerm
//
//  Created by macbook on 2019-12-04.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import AVFoundation
 import Foundation

class RegisterViewController: UIViewController {
    let session = AVCaptureSession()
      var camera: AVCaptureDevice?
      var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
      var cameraCaptureOutput: AVCapturePhotoOutput?
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var circularimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        circularimage.layer.masksToBounds = true
           circularimage.layer.cornerRadius = circularimage.bounds.width / 2
        
//        initializeCaptureSession()
    }
    
     
    @IBAction func SignUp(_ sender: Any) {
        
        if isValidEmail(email: email.text){
            
            if isValidPassword(testStr: password.text){
            self.performSegue(withIdentifier: "PreviewImage", sender: self)
               }
               else {
            let alertController = UIAlertController(title: "Invalid password", message:
                "Please Check password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
               }
            
            
            self.performSegue(withIdentifier: "PreviewImage", sender: self)
               }
               else {
            let alertController = UIAlertController(title: "Invalid Email", message:
                "Please Check Email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
               }
        
        
        
        
    }
    
    
        
    
    
    // validate an email for the right format
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
     
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    
    
    
    
//    func displayCapturedPhoto(capturedPhoto: UIImage){
//
//           let imagePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePreviewViewController") as! ImagePreviewViewController
//
//           ImagePreviewViewControlle.capturedImage = capturedPhoto
//           navigationController?.pushViewController(imagePreviewViewController, animated: true)
//       }
//
//       func initializeCaptureSession(){
//           session.sessionPreset = AVCaptureSession.Preset.high
//           camera = AVCaptureDevice.default(for: AVMediaType.video)
//           do {
//               let cameraCaptureInput = try AVCaptureDeviceInput(device: camera!)
//               cameraCaptureOutput = AVCapturePhotoOutput()
//               session.addInput(cameraCaptureInput)
//               session.addOutput(cameraCaptureOutput!)
//           }catch{
//               print(error.localizedDescription)
//           }
//           cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
//           cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
//           cameraPreviewLayer?.frame = view.bounds
//           cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
//
//           view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
//           session.startRunning()
//       }
//
//
//    @IBAction func takePicture(_ sender: Any) {
//
//        takePicture()
//    }
//
//
//     func takePicture(){
//            let settings = AVCapturePhotoSettings()
//                   settings.flashMode = .auto
//                   cameraCaptureOutput?.capturePhoto(with: settings, delegate: self)
//        }
//
//    }
//    extension ViewController : AVCapturePhotoCaptureDelegate{
//        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?){
//
//            if let unwrappedError = error{
//                print(unwrappedError.localizedDescription)
//            }else{
//
//                if let sampleBuffer = photoSampleBuffer,
//
//                 let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: photoSampleBuffer) {
//                if let finalImage = UIImage(data: dataImage){
//                    displayCapturedPhoto(capturedPhoto: finalImage)
//                }
//            }
//            }
//        }

}
