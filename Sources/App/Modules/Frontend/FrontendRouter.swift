import Vapor

struct FrontendRouter : RouteCollection {
    let controller = FrontendController()
    
    func boot(routes: RouteBuilder) throws {
        routes.get(use: controller.homeView)
    }
}