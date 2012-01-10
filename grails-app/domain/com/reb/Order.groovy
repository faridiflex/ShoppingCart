package com.reb

class Order {

//    TODO add user / customer class after sproing security plugin.
    String user
    String userMachineIPetc
    String deliveryAddress
    String contactNumber

    static hasMany = [productQuantities: OrderProductQuantity]

    static constraints = {
        productQuantities nullable: true
    }

    static mapping = {
        table 'customer_order'
    }
}
