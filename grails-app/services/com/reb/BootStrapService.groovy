package com.reb

import com.reb.enums.ProductStatus

class BootStrapService {

    def doBootStrap() {
        addSomeProductCategory()
        addSomeUserAndRoles()
        addSomeProducts()
    }

    def addSomeProductCategory() {
        log.debug("Adding some product category")
        new ProductCategory(name: 'Soap').save(flush: true)
        new ProductCategory(name: 'ToothPaste').save(flush: true)
        new ProductCategory(name: 'Shampoo').save(flush: true)
        new ProductCategory(name: 'Cosmetics').save(flush: true)
        assert ProductCategory.count() == 4
    }

    void addSomeProducts(){
        addAProductAndPrice('Sunsilk', ['Shampoo'], 13500)
        addAProductAndPrice('Head & Shoulders', ['Shampoo'], 23500)
        addAProductAndPrice('Clinic Plus', ['Shampoo'], 15100)
        addAProductAndPrice('All Clear', ['Shampoo'], 15000)
        addAProductAndPrice('Himalya', ['Shampoo'], 13000)
    }

    def addAProductAndPrice(String name , List<String> categoriesNames, Integer price)
    {
        log.debug("Adding some products and their price")
        Product product = new Product()
        categoriesNames.each {
            product.addToCategories(ProductCategory.findByName(it))
        }
        product.description = name
        product.name = name
        product.status = ProductStatus.ACTIVE
        if(!product.save()){
            log.error("Failed to save product ${name}")
        }
        
        ProductPrice productPrice= new ProductPrice(product: product, priceInPaise: price,validFrom: new Date()-10, validTill: new Date()+10 )
        if(!productPrice.save()){
            log.error("Failed to save price for product $name")
        }
    }


    def addSomeUserAndRoles() {
        log.debug("Adding some User and Roles")
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def createProductRole = new Role(authority: 'ROLE_CREATE_PRODUCT').save(flush: true)
        def custRole = new Role(authority: 'ROLE_CUSTOMER').save(flush: true)
        def guestRole = new Role(authority: 'ROLE_GUEST').save(flush: true)

        def adminUser = new User(username: 'admin', enabled: true, password: 'test')
        adminUser.save(flush: true)

        def cust1User = new User(username: 'cust1', enabled: true, password: 'test')
        cust1User.save(flush: true)

        def cust2User = new User(username: 'cust2', enabled: true, password: 'test')
        cust2User.save(flush: true)

        def cust3User = new User(username: 'cust3', enabled: true, password: 'test')
        cust3User.save(flush: true)

        UserRole.create adminUser, adminRole, true
        UserRole.create adminUser, createProductRole, true
        UserRole.create cust1User, custRole, true
        UserRole.create cust2User, custRole, true
        UserRole.create cust3User, custRole, true

        assert User.count() == 4
        assert Role.count() == 4
        assert UserRole.count() == 5
    }
}
