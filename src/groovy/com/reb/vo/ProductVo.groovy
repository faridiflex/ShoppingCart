package com.reb.vo

import com.reb.Product

class ProductVo {
    Long id
    String name
    String description
    String manufacturer
    byte[] primaryImage
    List<byte[]> secondaryImages
    List tags

    ProductVo(Product product) {
        id = product.id
        name = product.productInfo.name
        description = product.productInfo.description
        manufacturer = product.productInfo.manufacturer
        primaryImage = product.productInfo.primaryImage
        secondaryImages = product.productInfo.secondaryImages
    }
}
