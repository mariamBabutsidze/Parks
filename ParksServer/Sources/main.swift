import Foundation
import Vapor
import OpenAPIRuntime
import OpenAPIVapor


// Define a type that conforms to the generated protocol.
struct ParkServiceAPIImpl: APIProtocol {
    func getParks(
        _ input: Operations.getParks.Input
    ) async throws -> Operations.getParks.Output {
        let parks = [Components.Schemas.Park(title: "Algeti National Park", description: "Algeti National Park, 1 hour away from Tbilisi is the best place to enjoy the weekend. You will be astonished by the beautiful landscapes in place. There are arranged 5 eco-tourist trails on the park’s territory: horse-riding and pedestrian. Only one of them is marked – Samepo Kedi – 16 km circular trail, thus it is a nice idea to hike there. Besides Algeti River Valley and the ridges covered with forests, you are able to visit Dashbashi, Birtvisi and Samshvilde Canyons and as well as Kldekari Fortress. Plan your camping in Algeti National park and enjoy your trip. There is arranged eco-tourist attraction Rope Park at the yard of Algeti National Park’s visitor centre. There are arranged zones for adults and family trip, which unites from 10 to 14 barriers. Therefore, it is possible to enjoy nature and eco-tourist attractions even without leaving the yard."),
                     Components.Schemas.Park(title: "Borjomi-Kharagauli National Park", description: "Borjomi, famous with its mineral water directly from the tap in a fresh air is looking forward to your visit. The unique and fresh climate stipulates the limpid water. Do not hesitate to plan a trip in Borjom-Kharagauli National Park, enjoy hiking and spend week-end, vacation or even holiday in a diverse nature. Borjom-Kharagauli National Park is the first national park created in independent Georgia in 1995. It is one of the biggest park in Georgia, with the total area is 104,099 hectares, which is more than 1.5% of country’s territory. Take your backpack and enjoy the trip. It is one of the most adventurous destination in Georgia. Park offers you one and multi-day hiking tours. In total, 12 trails are marked. Tourist shelters, picnic and camping spots are available, as well as fire pits. The National Park also offers horse-riding, cycling, snow shoe trails, cultural and educational tours. There are rare species of animals and plants within the park’s territory and virgin forest. The Park’s territory includes following 6 municipalities: Borjomi, Kharagauli, Akhaltsikhe, Adigeni, Khashuri and Baghdati.")]
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
