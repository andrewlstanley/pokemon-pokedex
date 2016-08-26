//
//  PokeCell.swift
//  pokemon-pokedex
//
//  Created by Andrew Stanley on 8/26/16.
//  Copyright © 2016 Andrew Stanley. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        nameLabel.text = self.pokemon.name.capitalized
        
    }
    
    
}
