//
//  day21.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-21.
//

import Foundation

struct Ingredient {
    let name: String
    var allergen: String?
}

struct Food {
    var ingredients: [Ingredient]
    let allergens: [String]
}

struct ListOfFoods {
    let input: String

    func countNoAllergens() -> Int {

        var foods = [Food]()

        for line in input.split(separator: "\n") {
            var thisLine = line.replacingOccurrences(of: " (contains ", with: "|")
            thisLine = thisLine.replacingOccurrences(of: ")", with: "")
            thisLine = thisLine.replacingOccurrences(of: ", ", with: ",")
            let split = thisLine.split(separator: "|")
            let ingredients = split[0].split(separator: " ")
            let allergens = split[1].split(separator: ",")
            var ing = [Ingredient]()
            for oneIngredient in ingredients {
                ing.append(Ingredient(name: String(oneIngredient), allergen: nil))
            }
            var all = [String]()
            for oneAllergen in allergens {
                all.append(String(oneAllergen))
            }
            foods.append(Food(ingredients: ing, allergens: all))
        }

        var usedAllergens = Set<String>()
        for i in 0 ..< foods.count - 1 {
            for allergen in foods[i].allergens {
                if usedAllergens.contains(allergen) {
                    continue
                }
                var hasAllergen = true
                for k in 0 ..< foods[i].ingredients.count {
                    if foods[i].ingredients[k].allergen != nil {
                        continue
                    }
                    for j in i + 1 ..< foods.count {
                        if foods[j].allergens.contains(allergen) {
                            var hasIngredient = false
                            for ing in foods[j].ingredients {
                                if ing.name == foods[i].ingredients[k].name {
                                    hasIngredient = true
                                }
                                if hasIngredient {
                                    break
                                }
                            }
                            if !hasIngredient {
                                hasAllergen = false
                            }
                        }
                    }
                    if hasAllergen {
                        foods[i].ingredients[k].allergen = allergen
                        for j in i + 1 ..< foods.count {
                            for kk in 0 ..< foods[j].ingredients.count {
                                if foods[j].ingredients[kk].name == foods[i].ingredients[k].name {
                                    foods[j].ingredients[kk].allergen = allergen
                                }
                            }
                        }
                    }
                }
                usedAllergens.insert(allergen)
            }
        }


        return 5
    }
}
