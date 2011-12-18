import com.reb.Product

class BootStrap {

    def fixtureLoader

    def init = { servletContext ->
        if(!Product.count())
        {
            println("Loading products")
            fixtureLoader.load("products")
            fixtureLoader.load("sellers")
        }
    }
    def destroy = {
    }
}
