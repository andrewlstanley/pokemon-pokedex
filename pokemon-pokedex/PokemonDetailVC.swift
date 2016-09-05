//
//  PokemonDetailVC.swift
//  pokemon-pokedex
//
//  Created by Andrew Stanley on 8/26/16.
//  Copyright © 2016 Andrew Stanley. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIDLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = img
        currentEvoImage.image = img
        pokedexIDLabel.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetails {
            
            
      // Whatever we write will only be called after the network is called
            
            self.updateUI()
        }
    }
    func updateUI() {
        
        baseAttackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.description
        weightLabel.text = pokemon.weight
        TypeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
    
    if self.pokemon.nextEvolutionID == "" {
                
                self.evoLabel.text = "Completely Evolved"
                nextEvoImage.isHidden = true
            
            } else {
                nextEvoImage.isHidden = false
                nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
                let str = "Next Evolution: \(self.pokemon.nextEvolutionName) - LVL \(self.pokemon.nextEvolutionLevel)"
                self.evoLabel.text = str
            }
            
        }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
