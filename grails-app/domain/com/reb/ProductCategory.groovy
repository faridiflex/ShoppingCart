package com.reb

class ProductCategory {

    String name

    static constraints = {
        name unique: true
    }
}
