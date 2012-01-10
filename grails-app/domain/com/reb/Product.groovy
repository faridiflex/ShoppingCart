package com.reb

import com.reb.enums.ProductStatus

class Product {

    String name
    String description
    ProductStatus status

    static hasMany = [categories: ProductCategory]

    byte[] primaryImage

    static constraints = {
        primaryImage(nullable: true)
    }
}
