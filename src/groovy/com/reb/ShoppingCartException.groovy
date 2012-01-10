package com.reb


class ShoppingCartException extends Exception{
    ShoppingCartException() {
        super()    
    }

    ShoppingCartException(String s) {
        super(s)    
    }

    ShoppingCartException(String s, Throwable throwable) {
        super(s, throwable)    
    }

    ShoppingCartException(Throwable throwable) {
        super(throwable)    
    }
}
