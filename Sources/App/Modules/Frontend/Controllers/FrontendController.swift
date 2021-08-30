import Vapor
import Tau

struct FrontendController {
    func homeView(req: Request) throws -> EventLoopFuture<View> {
    return req.tau.render(template: "home", context: [
        "title": "myPage - Home",
        "header": "Hi there,",
        "message": "welcome to my awesome page!"
        ])
    }
}
