//
//  CameraViewController.swift
//  SnapMoji - Team 10 
//
//  Worked on by: Josh Baltar
//
//  Description of CameraViewControlelr:
//  Sets up camera to display what the camera can seeSends photo to the PreviewViewController
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  1.1 - Camera working and storing photos to phone and firebase
//  1.2 - Emotions passed through view controllers, Microsoft emotion API implemented
//
//  Known bugs:
//  There are no known bugs related to the CameraViewController.swift
//
//  Created by Josh Baltar on 2018-10-28.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
    var emotion = "emotion"
    var fileName = ".jpg"
 
    //load the camera and display what the camera sees on loading the view
    override func viewDidLoad() {
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        super.viewDidLoad()
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        // Do any additional setup after loading the view.
    }
    
    //function to capture the session
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    //function to prepare the device for camera display
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes:[AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        
        currentCamera = backCamera
    }
    
    //function to prepare input and output
    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            print(error)
        }
        
    }
    
    //function to prepare what will be sent to the preview of the photo
    func setupPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
    //function to implement the back button
    @IBAction func backButton_tap(_ sender: Any) {
        performSegue(withIdentifier: "cameraBackButton_Segue", sender: nil)
    }
    //function to start the camera after being set up
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    
    //function to take the photo
    @IBAction func cameraButton_touchUpInside(_ sender: Any) {
        //performSegue(withIdentifier: "showPhoto_Segue", sender: nil)
        let settings = AVCapturePhotoSettings()
        self.photoOutput?.capturePhoto(with: settings, delegate: self)
        //needed to add 'as! AVCapturePhotoCaptureDelegate' to fix error in above line
    }
    
    //prepare what will be sent to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "previewPhoto_Segue" {
            let previewVC = segue.destination as! PreviewViewController
            previewVC.image = self.image
            previewVC.emotion = emotion
            previewVC.fileName = fileName
            previewVC.fromGallery = false
        }
    }

}

//extend the cameraViewController to output photos
extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            self.image = UIImage(data: imageData)
            performSegue(withIdentifier: "previewPhoto_Segue", sender: nil)
        }
    }
}
