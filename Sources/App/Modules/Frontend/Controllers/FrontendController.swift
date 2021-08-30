import Vapor
import Tau

struct FrontEndController {
    func homeView(req: Request) throws -> EventLoopFuture<View> {
    return req.tau.render(template: "index", context: [
        "title": "myPage -Home",
        "body": "Hi there,",
        "message": "welcome to my awesome page!"
        ])
    }
}
