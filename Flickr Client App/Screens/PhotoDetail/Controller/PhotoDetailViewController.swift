//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by halil dikişli on 26.06.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ownerImageView.layer.cornerRadius = 22.0
        
        title = "Photo Detail"
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "Description Label, Description Label Description Label Description Label Description Label"
        
        ownerNameLabel.text = photo?.ownername
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconUrl) { data in
                       self.ownerImageView.image = UIImage(data: data)
                   }
        
        NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
        
        title = photo?.title
        
        descriptionLabel.text = photo?.Description?.content
    }
    
  
}
