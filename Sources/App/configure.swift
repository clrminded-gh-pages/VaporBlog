import Tau
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // use the Public directory to serve public files
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    
    // setup custom template location
    let detected = TemplateEngine.rootDirectory ?? app.directory.viewsDirectory
    TemplateEngine.rootDirectory = detected
    
    TemplateEngine.sources = .singleSource(FileSource(fileio: app.fileio,
                                                      limits: .default,
                                                      sandboxDirectory: detected,
                                                      viewDirectory: detected,
                                                      defaultExtension: "html"))
    
    // disable template cache
    if !app.environment.isRelease {
        TemplateRenderer.Option.caching = .bypass
    }
    
    
    // Use Tau as template engine
    app.views.use(.tau)
    
    // register routes
    try routes(app)
}
