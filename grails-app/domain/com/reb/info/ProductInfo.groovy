package com.reb.info

class ProductInfo {

    String name
    String description
    String manufacturer

    byte[] primaryImage
    List<byte[]> secondaryImages

      static constraints = {
          primaryImage(nullable: true)
          secondaryImages(nullable: true)
    }
}
