import Foundation
import Vapor
import OpenAPIRuntime
import OpenAPIVapor


// Define a type that conforms to the generated protocol.
struct ParkServiceAPIImpl: APIProtocol {
    func getParks(
        _ input: Operations.getParks.Input
    ) async throws -> Operations.getParks.Output {
        let parks = [Components.Schemas.Park(title: "Algeti National Park", rating: 5.0, icon: "https://nationalparks.ge/files/15300054817330624374_431322507318925_6228581445472878592_o.jpg"),
                     Components.Schemas.Park(title: "Borjomi-Kharagauli National Park", rating: 4.2, icon: "https://nationalparks.ge/files/153000541880%E1%83%91%E1%83%9D%E1%83%A0%E1%83%AF%E1%83%9D%E1%83%9B-%E1%83%AE%E1%83%90%E1%83%A0%E1%83%90%E1%83%92%E1%83%90%E1%83%A3%E1%83%9A%E1%83%98%20(10).jpg")]
        return .ok(.init(body: .json(parks)))
    }
}


// Create your Vapor application.
let app = Vapor.Application()


// Create a VaporTransport using your application.
let transport = VaporTransport(routesBuilder: app)


// Create an instance of your handler type that conforms the generated protocol
// defininig your service API.
let handler = ParkServiceAPIImpl()


// Call the generated function on your implementation to add its request
// handlers to the app.
try handler.registerHandlers(on: transport, serverURL: Servers.server1())


// Start the app as you would normally.
try await app.execute()
