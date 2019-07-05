//
//  SourcesViewController.swift
//  iCatchUp
//
//  Created by Developer on 10/23/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

private let reuseIdentifier = "Cell"

class SourceCell: UICollectionViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func update(from source: Source) {
        logoImageView.setImage(
            fromUrlString: source.urlToLogo,
            withDefaultImage: "no-image-available",
            withErrorImage: "no-image-available")
        nameLabel.text = source.name
        favoriteImageView.setImage(fromAsset: source.isFavorite ? "favorite-icon-black" : "favorite-icon-border-black")
    }
}

class SourcesViewController: UICollectionViewController {
    
    var sources: [Source] = [Source]()
    var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsApi.getSources(responseHandler: handleResponse,
                           errorHandler: handleError)

    }

    override func viewWillAppear(_ animated: Bool) {
        if sources.count > 0 {
            self.collectionView.reloadItems(at: [IndexPath(item: currentRow, section: 0)])
        }
    }
    
    func handleResponse(response: SourcesResponse) {
        guard let sources = response.sources else {
            self.sources = [Source]()
            return
        }
        self.sources = sources
        self.collectionView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Sources: \(error.localizedDescription)"
        os_log("%@", message)
    }
    


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SourceCell
    
        // Configure the cell
        cell.update(from: sources[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSource" {
            let destination = segue.destination as! SourceViewController
            destination.source = sources[currentRow]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.item
        performSegue(withIdentifier: "showSource", sender: self)
    }
}
