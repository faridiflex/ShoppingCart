package com.reb

class BootStrapService {

    def doBootStrap() {
        new ProductCategory(name: 'Soap').save()
        new ProductCategory(name: 'ToothPaste').save()
        new ProductCategory(name: 'Shampoo').save()
        new ProductCategory(name: 'Cosmetics').save()
    }
}
