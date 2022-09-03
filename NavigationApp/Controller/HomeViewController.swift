//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by Kevin Hernández on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var cardView: UIImageView!
    @IBOutlet var genreCollectionView: UICollectionView!
    let movieDataManager = MovieDataManager()
    let genreDataManager = GenreDataManager()
    let defaultGenre = "Adventure"
    var genreIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreDataManager.fetch()
    }
    
    @IBAction func viewDetailButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }

}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(genreDataManager.genreCount())
        return genreDataManager.genreCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCellCollectionViewCell
        let genre = genreDataManager.genreAt(index: indexPath.row)
        //cell.genreImageView.image = UIImage.init(named: genre.image)
        cell.genreLabel.text = genre.genre
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        genreIndex = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}
