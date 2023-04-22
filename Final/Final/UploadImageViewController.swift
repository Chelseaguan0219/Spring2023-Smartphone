//
//  UploadImageViewController.swift
//  Final
//
//  Created by chelsea on 4/22/23.
//

import UIKit
import CoreLocation
class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let locationManager = CLLocationManager()
    
    var uploadProtocol : UploadImageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //locationManager.requestLocation()
    }
    
    @IBAction func uploadAction(_ sender: Any) {
        
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
        
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title )
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func takeAPictureAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a picture", message: "Something", preferredStyle: .alert)
        //camera
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
            }
        
        //photot library
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
            }
        
        //cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel")
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = image
            
                  locationManager.delegate = self
                  locationManager.requestWhenInUseAuthorization()
                  locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                  locationManager.startUpdatingLocation()
        }
        picker.dismiss(animated: true)
      
    }
    
 
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let geoCoder = CLGeocoder()
           geoCoder.reverseGeocodeLocation(location) { placemarks, error in
               if error != nil {
                   print(error as Any)
                   return
               }
               guard let placemark = placemarks?.first else { return }
               if let streetNumber = placemark.subThoroughfare,
                          let streetName = placemark.thoroughfare,
                          let city = placemark.locality
//                          let state = placemark.administrativeArea,
//                          let zipCode = placemark.postalCode
               {
                           let address = "\(streetNumber) \(streetName), \(city)"
                           self.lblLocation.text = address
                       }
              
               
           }

    }

    //show the actual address based on the longtitude and latitude
    func getAddressFromLocation(location: CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location){ placemarks, error in
            if error != nil {
                print(error as Any)
                return
            }
            var address = ""
            guard let place = placemarks?.first else {return}
            if place.name != nil {
                address += place.name! + ","
            }
            if place.locality != nil {
                address += place.locality! + ","
            }
            if place.subLocality != nil {
                address += place.subLocality! + ","
            }
            if place.country != nil {
                address += place.country! + ","
            }
            if place.postalCode != nil {
                address += place.postalCode! + ","
            }
            print(address)
        }
    }







        
    }
    


