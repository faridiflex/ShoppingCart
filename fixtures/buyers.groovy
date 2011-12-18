import com.reb.Seller
import com.reb.info.Address
import com.reb.info.ContactInfo
import com.reb.info.RegistrationInfo
import com.reb.profile.SellerProfile
import com.reb.Buyer
import com.reb.profile.BuyerProfile
import com.reb.info.PersonInfo

fixture {

    //Mohd Farid
    mohdFaridAddress(Address) {
        addLine1 = 'House No 212'
        addLine2 = 'Pi'
        landmark = 'aichhar village'
        city = 'Greater Noida'
        state = 'Uttar Pradesh'
        pinCode = 201308
    }
    mohdFaridContactInfo(ContactInfo) {
        name = 'Mohd Farid'
        phone = '99999912912'
        mobile = '12999091209012'
        email = 'farid.iflex@gmail.com'
        address = mohdFaridAddress
    }
    mohdFaridRegistrationInfo(RegistrationInfo) {
        registrationDate = Date.parse('dd-MM-yyyy', '01-08-2011')
        activationDate = Date.parse('dd-MM-yyyy', '11-08-2011')
    }

    mohdFaridProfile(BuyerProfile) {
        name = 'Mohd Farid'
        contactInfo = relianceFreshContactInfo
        registrationInfo = mohdFaridRegistrationInfo
    }
    mohdFarid(Buyer) {
        loginId = 'reliancefresh'
        profile =  mohdFaridProfile
    }
}

post {
}
