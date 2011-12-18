package com.reb

import com.reb.profile.SellerProfile
import com.reb.info.Tag

class Seller {

    String loginId
    SellerProfile profile

    static hasMany = [tags:Tag]

    static constraints = {
    }
}
