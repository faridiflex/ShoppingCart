package com.reb



import org.junit.*
import grails.test.mixin.*

@TestFor(BuyerController)
@Mock(Buyer)
class BuyerControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/buyer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.buyerInstanceList.size() == 0
        assert model.buyerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.buyerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.buyerInstance != null
        assert view == '/buyer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/buyer/show/1'
        assert controller.flash.message != null
        assert Buyer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/buyer/list'


        populateValidParams(params)
        def buyer = new Buyer(params)

        assert buyer.save() != null

        params.id = buyer.id

        def model = controller.show()

        assert model.buyerInstance == buyer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/buyer/list'


        populateValidParams(params)
        def buyer = new Buyer(params)

        assert buyer.save() != null

        params.id = buyer.id

        def model = controller.edit()

        assert model.buyerInstance == buyer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/buyer/list'

        response.reset()


        populateValidParams(params)
        def buyer = new Buyer(params)

        assert buyer.save() != null

        // test invalid parameters in update
        params.id = buyer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/buyer/edit"
        assert model.buyerInstance != null

        buyer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/buyer/show/$buyer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        buyer.clearErrors()

        populateValidParams(params)
        params.id = buyer.id
        params.version = -1
        controller.update()

        assert view == "/buyer/edit"
        assert model.buyerInstance != null
        assert model.buyerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/buyer/list'

        response.reset()

        populateValidParams(params)
        def buyer = new Buyer(params)

        assert buyer.save() != null
        assert Buyer.count() == 1

        params.id = buyer.id

        controller.delete()

        assert Buyer.count() == 0
        assert Buyer.get(buyer.id) == null
        assert response.redirectedUrl == '/buyer/list'
    }
}
