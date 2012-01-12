class BootStrap {

    def bootStrapService

    def init = { servletContext ->
        bootStrapService.doBootStrap()
    }
    def destroy = {
    }
}
