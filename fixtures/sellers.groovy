import com.reb.Seller
import com.reb.info.Address
import com.reb.info.ContactInfo
import com.reb.info.RegistrationInfo
import com.reb.profile.SellerProfile

fixture {

    //Reliance Fresh
    relianceFreshAddress(Address) {
        addLine1 = 'Shop No 212'
        addLine2 = 'Conaught Place'
        landmark = 'cp'
        city = 'New Delhi'
        state = 'New Delhi'
        pinCode = 110011
    }

    relianceFreshContactInfo(ContactInfo) {
        name = 'Anil'
        phone = '99999912912'
        mobile = '12999091209012'
        email = 'abc@gmail.com'
        address = relianceFreshAddress
    }

    relianceFreshRegistrationInfo(RegistrationInfo) {
        registrationDate = Date.parse('dd-MM-yyyy', '01-08-2011')
        activationDate = Date.parse('dd-MM-yyyy', '11-08-2011')
    }

    relianceFreshProfile(SellerProfile) {
        name = 'Reliance Fresh'
        contactInfo = relianceFreshContactInfo
        registrationInfo = relianceFreshRegistrationInfo
    }
    relianceFresh(Seller) {
        loginId = 'reliancefresh'
        profile = relianceFreshProfile
    }
}

post {
}
