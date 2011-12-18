package shoppingcart

class ShoppingCartFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                println "Controller: $controllerName, Action: $actionName, Params: $params"
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
