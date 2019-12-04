//
//  ImagePreviewViewController.swift
//  EndTerm
//
//  Created by macbook on 2019-12-04.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var shortBio: UILabel!
    @IBOutlet weak var CircularImage: UIImageView!
    
    var names: String?
      var bio: String?
    var capturedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CircularImage.layer.masksToBounds = true
        CircularImage.layer.cornerRadius = CircularImage.bounds.width / 2
        CircularImage.image = capturedImage
        
        shortBio.text = bio;
        name.text = names;
        CircularImage.image = capturedImage;
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
