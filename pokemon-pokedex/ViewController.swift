//
//  ViewController.swift
//  pokemon-pokedex
//
//  Created by Andrew Stanley on 8/26/16.
//  Copyright © 2016 Andrew Stanley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
// UICollectionViewDelegate = This class is the delegate for the collection view
   
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
                
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Create the cells themselves. Dequeues the cells when needed and sets them back up.
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            
            return cell
        } else { return UICollectionViewCell()
        
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Will execute the code inside when the user taps on the cell itself. 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns the amount of items in the CollectionView that you want to see at the current moment.
        return pokemon.count 
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //returns number of objects in the collection view.
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //returns the size of the items from the CollectionView.
        return CGSize(width: 105, height: 105)
    }
    
}

