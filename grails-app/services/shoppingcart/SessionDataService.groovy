package shoppingcart

class SessionDataService {

    static transactional = true

    static scope = 'session'

    String name
    int age
    String address
    Date lastLogin =new Date()


    String toString()
    {
        "name: $name, age: $age, address: $address, lastLogin: ${lastLogin.format('HH:mm:ss')}"
    }

}
