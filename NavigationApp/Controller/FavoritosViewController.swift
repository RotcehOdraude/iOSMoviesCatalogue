//
//  FavoritosViewController.swift
//  NavigationApp
//
//  Created by Kevin Hernández on 02/09/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    let posters = ["0","1","2","3","4"]

    @IBOutlet var favoritePosterImage: UIImageView!
    
    @IBOutlet var posterPageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        posterPageControl.numberOfPages = posters.count
        favoritePosterImage.image = UIImage(named: posters.first!)

        // Do any additional setup after loading the view.
    }
    @IBAction func posterPageControlAction(_ sender: UIPageControl) {
        
        favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
            }
    @IBAction func leftSwipeDone(_ sender: Any) {
        print("left swipe")
        if posterPageControl.currentPage == 0 {
            posterPageControl.currentPage = posters.count - 1
            favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
        }else{
            posterPageControl.currentPage = posterPageControl.currentPage - 1
            favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
        }

    }
    @IBAction func rightSwipeDone(_ sender: Any) {
        print("right swipe")
        if posterPageControl.currentPage < posters.count - 1{
            posterPageControl.currentPage = posterPageControl.currentPage + 1
            favoritePosterImage.image = UIImage(named: posters[posterPageControl.currentPage])
        }else{
            favoritePosterImage.image = UIImage(named: posters[0])
            posterPageControl.currentPage = 0
        }
        
            
    }
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


