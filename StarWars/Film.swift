import Foundation

struct Film {
    let title: String
    let episodeId: Int
    let episodeCrawl: String
    let director: String
    let producer: String
    let releaseDate: Date
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]

    init(data: [String: Any]) {
        title = data["title"] as? String ?? ""
        episodeId = data["episode_id"] as? Int ?? 0
        episodeCrawl = data["episode_crawl"] as? String ?? ""
        director = data["director"] as? String ?? ""
        producer = data["producer"] as? String ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let releaseString: String = data["release_date"] as? String ?? ""
        releaseDate = dateFormatter.date(from: releaseString) ?? Date()
        characters = data["characters"] as? [String] ?? []
        planets = data["planets"] as? [String] ?? []
        starships = data["starships"] as? [String] ?? []
        vehicles = data["vehicles"] as? [String] ?? []
        species = data["species"] as? [String] ?? []
    }
}
