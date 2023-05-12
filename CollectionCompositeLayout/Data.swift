//
//  Data.swift
//  CollectionCompositeLayout
//
//  Created by Tony Chen on 20/4/2023.
//

import Foundation

struct categoryDetails {
    let title: String
    let image: String
    
    static let categoryItem: [categoryDetails] = [
        categoryDetails(title: "Baby Products", image: "babyproducts"),
        categoryDetails(title: "Breads", image: "bread"),
        categoryDetails(title: "Fruits", image: "fruits"),
        categoryDetails(title: "Meat", image: "meat"),
        categoryDetails(title: "Seafood", image: "seafood"),
        categoryDetails(title: "Sweets", image: "sweets"),
        categoryDetails(title: "Toiletries", image: "toiletries"),
        categoryDetails(title: "Vegetables", image: "vegetables")
    ]
}

struct promationOfferDetails {
    let description: String
    let image: String
    
    static let promotionItem: [promationOfferDetails] = [
        promationOfferDetails(description: "Taste the flavors of the world with our internation cuisine! From spicy Thai curries to classic Italian pastas, we've got something to satisfy every craving.",
                              image: "promotion1"),
        promationOfferDetails(description: "Take your taste buds on a journey with our fusing cuisine!",
                              image: "promotion2"),
        promationOfferDetails(description: "Great seafood fix with our fresh catches from the ocean! our menue features are variety of seafdd dishes",
                              image: "promotion3")
    ]
    
    static let featureOfferItem: [promationOfferDetails] = [
        promationOfferDetails(description: "Raise a glass to good times with our wide selection of cold beers on tap", image: "beer"),
        promationOfferDetails(description: "Sink your teeth into the juiciest burgers in town!!", image: "burger"),
        promationOfferDetails(description: "Fast food that's convenient without scrificing quality", image: "fastfood")
    ]
}

struct hotOfferDetails {
    let title: String
    let calories: String
    let carbon: String
    let fat: String
    let price: String
    let image: String
    
    static let hotOfferItem: [hotOfferDetails] = [
        hotOfferDetails(title: "Barbecue", calories: "500", carbon: "20", fat: "120", price: "17.50", image: "barbecue"),
        hotOfferDetails(title: "Burger", calories: "1000", carbon: "50", fat: "100", price: "18.60", image: "burger"),
        hotOfferDetails(title: "Hotdog", calories: "250", carbon: "40", fat: "60", price: "11.00", image: "hotdog"),
        hotOfferDetails(title: "Pancake", calories: "350", carbon: "40", fat: "70", price: "12.50", image: "pancake"),
        hotOfferDetails(title: "Pizza", calories: "1200", carbon: "30", fat: "40", price: "22.00", image: "pizza"),
        hotOfferDetails(title: "Sushi", calories: "100", carbon: "10", fat: "5", price: "9.00", image: "sushi")
    ]
}
