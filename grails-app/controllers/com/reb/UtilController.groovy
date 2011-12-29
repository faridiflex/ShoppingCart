package com.reb

class UtilController {

    def sessionDataService

    def index = { render('Values '+sessionDataService)}

    def farid = {
        sessionDataService.name = 'farid'
        sessionDataService.age = 27
        sessionDataService.address = 'noida'
        redirect(action: 'index')
    }

    def shahid = {
        sessionDataService.name = 'shahid'
        sessionDataService.age = 25
        sessionDataService.address = 'hyderabad'
        render "set the values for farid"
        redirect(action: 'index')
    }


}
