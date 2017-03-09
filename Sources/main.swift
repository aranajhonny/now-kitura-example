
import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import CloudFoundryDeploymentTracker

do {
  // HeliumLogger disables all buffering on stdout
  HeliumLogger.use(LoggerMessageType.info)
  let controller = try Controller()
  Log.info("Server will be started on '\(controller.url)'.")
  CloudFoundryDeploymentTracker(repositoryURL: "https://github.com/IBM-Bluemix/Kitura-Starter.git", codeVersion: nil).track()
  Kitura.addHTTPServer(onPort: 3000, with: controller.router)
  Kitura.run()
} catch let error {
  Log.error(error.localizedDescription)
  Log.error("Oops... something went wrong. Server did not start!")
}
