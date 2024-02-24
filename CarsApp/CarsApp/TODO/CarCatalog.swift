//
//  CarCatalog.swift
//  CarsApp
//
//  Created by Abdulaziz Albahar on 1/15/24.
//

import Foundation

/*
 TODO: PART 3
     You are given a class called CarCatalog, with certain variables such as carsAvailable (mapping of CarModel to amount available), favourites (list of CarModels), etc.
     Implement the empty functions throughout this class - favourite(CarModel), getCarAvailability(CarModel), getAvailableCars(), filterCarsBy(brand).
     Some helper functions will already be given. Implement the class initializer to initialize your variables.
 */

class CarCatalog {

    var carsAvailable: [CarModel : Int] // A mapping of the car models to the amount of these models available.
    var displayedCars: [CarModel]
    var favourites: [CarModel]
    
    /*
     TODO: write an initializer that fetches all the car models. For the purposes of this assignment, initialize carsAvailable to a default array of 5-6 car models of your choice, with an arbitrary number representing their amount. Make sure the displayedCars are initialized with all the cars in carsAvailable. Upon launch, the user should have no favourites (empty).
     NOTE: The ids of the cars you provide must be unique, otherwise the app will crash.
    */
    init() {
        self.carsAvailable = [CarModel(id: "1", brand: CarBrand.Mercedes, modelName: "Beth", topSpeed: 99, color: "blue", fuelCapacity: 15) : 5,CarModel(id: "2", brand: CarBrand.Ford, modelName: "F150", topSpeed: 33, color: "Grey", fuelCapacity: 10) : 3, CarModel(id: "3", brand: CarBrand.Toyota, modelName: "Camry", topSpeed: 34, color: "Blue", fuelCapacity: 20) : 7, CarModel(id: "4", brand: CarBrand.Ford, modelName: "Fusion", topSpeed: 55, color: "White", fuelCapacity: 17) : 10, CarModel(id: "5", brand: CarBrand.Porsche, modelName: "Porshette", topSpeed: 99, color: "galaxy", fuelCapacity: 3) : 1]
        self.favourites = []
        self.displayedCars = [CarModel(id: "1", brand: CarBrand.Mercedes, modelName: "Beth", topSpeed: 99, color: "blue", fuelCapacity: 15), CarModel(id: "2", brand: CarBrand.Ford, modelName: "F150", topSpeed: 33, color: "Grey", fuelCapacity: 10), CarModel(id: "3", brand: CarBrand.Toyota, modelName: "Camry", topSpeed: 34, color: "Blue", fuelCapacity: 20), CarModel(id: "4", brand: CarBrand.Ford, modelName: "Fusion", topSpeed: 55, color: "White", fuelCapacity: 17), CarModel(id: "5", brand: CarBrand.Porsche, modelName: "Porshette", topSpeed: 99, color: "galaxy", fuelCapacity: 3)]
    }
    
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to ADD/REMOVE this car from their favourites list. Change the state of the favourites array to accomplish this.
     */
    func toggleFavourite(car: CarModel) {
        if self.favourites.contains(car) {
            self.favourites.remove(at: self.favourites.firstIndex(of: car)! )
        } else {
            self.favourites.append(car)
        }
 
    }
    
    /*
        TODO: implement this function
        This function gets called by the UI whenever the user wants to view the amount of cars available from a certain model.
     */
    func getCarAvailability(car: CarModel) -> Int {
        return self.carsAvailable[car] ?? 0

    }
    
    /*
        TODO: implement this function
        Set the displayedCars to all the available cars excluding any car that IS NOT of the given brand. In essence, this is the filtering functionality our app uses to display cars of a certain brand.
        NOTE: make sure you handle the case where it's 'none', as it implies that we don't want a filter.
     */
    func filterCarsBy(brand: CarBrand) {
        var x: [CarModel] = []
        for (key, val) in self.carsAvailable {
            if brand == CarBrand.none {
                x.append(key)
            } else if key.brand == brand {
                x.append(key)
            }
        }
        self.displayedCars = x
    }
    
    
    
}
