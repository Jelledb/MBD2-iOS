//
//  TvShowDetailViewController.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 29-03-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import UIKit

class TvShowDetailViewController: ColorUIViewController {
    var tvShow: TvShow?;
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Swift.print(tvShow);
        
        // Title
        self.title = self.tvShow!.name;
        
        // Load the Image (if any)
        if (tvShow!.image["medium"] != nil) {
            let url = URL(string: tvShow!.image["medium"]!);
            Swift.print(tvShow!.image["medium"]!);
            
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
                catch {
                    Swift.print(error)
                }
            }
        }
        
        // Description
        descLabel.text = tvShow!.summary.htmlToString
        
        // Genres
        let genres = tvShow!.genres.joined(separator: ", ")
        Swift.print(tvShow!.genres)
        genreLabel.text = "Genres: \(genres)"
        
        // Rating
        if tvShow!.rating["average"]! != nil {
            ratingLabel.text = "Rating: \(tvShow!.rating["average"]!!)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickReadMore(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: tvShow!.url)!)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
