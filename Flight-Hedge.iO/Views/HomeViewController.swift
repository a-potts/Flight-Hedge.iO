//
//  HomeViewController.swift
//  Flight-Hedge.iO
//
//  Created by Austin Potts on 7/25/23.
//

import UIKit
import Vision


//MARK: Global Notification Key for Observer
let ticketChangeNotificationKey = "flight.hedge"


class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    let ticketChangeNotification = Notification.Name(ticketChangeNotificationKey)
    
    //Varibales
    var ticket: Ticket?
    
    
    
    @IBOutlet weak var ticketView: UIView!
    @IBOutlet weak var insuranceQuoteView: UIView!
    @IBOutlet weak var ticketDetailsView: UIView!
    
    
    
    @IBOutlet weak var ticketImage: UIImageView!
    
    //Labels
    @IBOutlet weak var departLabel: UILabel!
    @IBOutlet weak var departTimeLabel: UILabel!
    @IBOutlet weak var arrivaTimelLabel: UILabel!
    @IBOutlet weak var estimatedDuration: UILabel!
    @IBOutlet weak var terminal: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    

    
    
    
    
    //Create a shared instance of VCOne

     static var sharedInstance:HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        createObserver()
        
        HomeViewController.sharedInstance = self
        
    }
    
    
    //If you dont deinit & remove the notification, you will have all of these observers listening for nitifcations, it could cause confusion & mess
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }

    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.updateTicketLabels(notification:)), name: ticketChangeNotification, object: nil)
    }
    
    
    @objc func updateTicketLabels(notification: Notification){
        
        //MARK: Update labels from Notification Center
        departLabel.text = ticket!.departFrom
        arrivalLabel.text = ticket!.arrivalTo
        
        departTimeLabel.text = ticket!.departTime
        arrivaTimelLabel.text = ticket!.arrivalTime
        estimatedDuration.text = ticket!.estimatedTime
        terminal.text = ticket!.terminal
    }
    
    
    func setUpViews() {
        
        ticketView.layer.cornerRadius = 7
        ticketView.layer.shadowOpacity = 1
     
        
        ticketDetailsView.layer.cornerRadius = 7
        
        insuranceQuoteView.layer.cornerRadius = 7
        insuranceQuoteView.layer.shadowOpacity = 1
        
        
        
    }
    
    
    //MARK: Text Recognition with Vision Kit
    // This is the function I will use to pass in a image that is taken by the camera
    func recognizeText(image: UIImage?) {
        
        guard let cgImage = image?.cgImage else {return}
        
        //Handler
        let handler = VNImageRequestHandler(cgImage: cgImage)
        
        
        //Request
        let request = VNRecognizeTextRequest{ [weak self] request, error in
            guard let observedInfo = request.results as? [VNRecognizedTextObservation], error == nil else {
                return
            }
            
            let text = observedInfo.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
            
            
            //We are in a closiure on a background thread, we want to make sure we dispatch to the main thread
//            DispatchQueue.main.async { self?.departLabel2.text = text
//                print("Flight Details ::\(text)")
//            }
           
        }
        
        
        //Proccess Request
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }

    
   //MARK: Image Picker
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
                  picker.allowsEditing = false
                  picker.delegate = self
                  picker.sourceType = .photoLibrary
                  present(picker, animated: true)
    }
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
 

}

extension HomeViewController {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 227, height: 227), true, 2.0)
        image.draw(in: CGRect(x: 0, y: 0, width: 414, height: 326))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) //3
        
        context?.translateBy(x: 0, y: newImage.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        ticketImage.image = newImage
        
        
        recognizeText(image: newImage)
        
    }
    
}
