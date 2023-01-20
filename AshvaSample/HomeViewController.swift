//
//  ViewController.swift
//  AshvaSample
//
//  Created by Kushagra Sharma on 19/01/23.
//

import UIKit

class HomeViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    var outImage:UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        

        guard let image = info[.editedImage] as? UIImage
        else {
            print("No image found")
            return
        }

        // print out the image size as a test
        outImage = image
        performSegue(withIdentifier: "detailSegue", sender: Any?.self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{

            if let destinationVC = segue.destination as? DetailViewController {
                print(outImage.size)
                destinationVC.textImage = self.outImage
                destinationVC.textFromImage = "Apple"
            }
        }

    }
}

