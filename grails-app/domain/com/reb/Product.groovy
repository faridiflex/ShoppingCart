package com.reb

import com.reb.enums.ProductStatus

class Product {

    String name
    String description
    ProductStatus status
    byte[] primaryImage

    static hasMany = [categories: ProductCategory]
    static constraints = {
        primaryImage(nullable: true)
    }

    static transients = ['price']

    Integer getPrice() {
        ProductPrice.find {
            product == this
            validFrom < new Date()
            validTill > new Date()
        }?.priceInPaise
    }

}
