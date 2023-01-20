//
//  DetailViewController.swift
//  AshvaSample
//
//  Created by Kushagra Sharma on 19/01/23.
//

import UIKit
import MLKit
class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textArea: UITextView!
    var textImage:UIImage!
    var textFromImage:String = "banana"
    let textRecognizer = TextRecognizer.textRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

        print(textImage.size)
        imageView.image = self.textImage
        let visionImage = VisionImage(image: textImage!)
        
        textRecognizer.process(visionImage) { result, error in
          guard error == nil, let result = result else {
            // Error handling
            return
          }
          // Recognized text
            let resultText = result.text
            self.textArea.text = resultText
        }
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
