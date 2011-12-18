package com.reb

import com.reb.profile.BuyerProfile
import com.reb.info.Tag

class Buyer {

    String loginId
    BuyerProfile profile

    static hasMany = [tags: Tag]

    static constraints = {
    }
}
