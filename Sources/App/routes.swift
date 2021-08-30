import Vapor
import Tau

struct FrontEndController {
    func homeView(req: Request) throws -> EventLoopFuture<View> {
    return req.tau.render(template: "index", context: [
        "title": "myPage -Home",
        "body": "Hi there, welcome!",
        ])
    }
}

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
}
