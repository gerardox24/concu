//
//  ArticlesViewController.swift
//  iCatchUp
//
//  Created by Developer on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os
private let reuseIdentifier = "Cell"

class ArticlesViewController: UICollectionViewController {
    var articles: [Article] = [Article]()
    var currentRow: Int = 0
    var isRestrictedToFavorites = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    func updateData() {
        if isRestrictedToFavorites, let sources = CatchUpStore.shared.sourceIdsAsString() {
            NewsApi.getEverything(
                fromSources: sources,
                responseHandler: handleResponse, errorHandler: handleError)
            return
        }
        if isRestrictedToFavorites {
            self.articles = [Article]()
            self.collectionView.reloadData()
            self.collectionView.collectionViewLayout.invalidateLayout()
            return
        }
        NewsApi.getTopHeadlines(responseHandler: handleResponse,
                                errorHandler: handleError)
    }
    
    func handleResponse(response: ArticlesResponse) {
        guard let articles = response.articles else {
            self.articles = [Article]()
            return
        }
        self.articles = articles
        self.collectionView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Articles:\(error.localizedDescription)"
        os_log("%@", message)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArticle" {
            let destination = segue.destination as! ArticleViewController
            destination.article = articles[currentRow]
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        // Configure the cell
        cell.update(from: articles[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        performSegue(withIdentifier: "showArticle", sender: self)
    }
}
