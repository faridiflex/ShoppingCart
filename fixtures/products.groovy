import com.reb.Product
import com.reb.info.ProductInfo

fixture {

    //Maggi
    maggiInfo(ProductInfo) {
        name = 'Maggi'
        description = '2 minute noodle'
        manufacturer = "nestle"
    }
    maggi(Product) {
        productInfo = maggiInfo
    }

    //Dairymilk
    dairyMilkInfo(ProductInfo) {
        name = 'Dairy Milk'
        description = 'Chocalate'
        manufacturer = "cadbury"
    }

    dairyMilk(Product) {
        productInfo = dairyMilkInfo
    }
}

post {
}
