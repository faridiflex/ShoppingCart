package com.reb

class OrderProductQuantity {

    Product product
    Integer quantity
    Integer unitPriceInPaise

    static belongsTo = [order: Order]
    
    static constraints = {
    }
}
