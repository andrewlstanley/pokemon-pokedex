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
    
    
    //rounded corners for cells. This is the layer level where we are modifying the corners.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        
        nameLabel.text = self.pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
    
}
