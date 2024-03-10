//
//  Created by Sukhaman Singh on 3/2/24.
//

import Foundation


// MARK: - Welcome
struct MovieList: Codable {
    var page: Int
    var next: String?
    var entries: Int?
    var results: [MoviesTitle]
}

// MARK: - Result
struct MoviesTitle: Codable {
    var id, resultID: String
    var primaryImage: PrimaryImage?
    var titleType: TitleType
    var titleText, originalTitleText: TitleText
    var releaseYear: ReleaseYear
    var releaseDate: ReleaseDate?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case resultID = "id"
        case primaryImage, titleType, titleText, originalTitleText, releaseYear, releaseDate
    }
}

// MARK: - TitleText
struct TitleText: Codable {
    var text: String
    var typename: OriginalTitleTextTypename

    enum CodingKeys: String, CodingKey {
        case text
        case typename = "__typename"
    }
}

enum OriginalTitleTextTypename: String, Codable {
    case titleText = "TitleText"
}

// MARK: - PrimaryImage
struct PrimaryImage: Codable {
    var id: String
    var width, height: Int
    var url: String
    var caption: Caption
    var typename: String

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, caption
        case typename = "__typename"
    }
}

// MARK: - Caption
struct Caption: Codable {
    var plainText, typename: String

    enum CodingKeys: String, CodingKey {
        case plainText
        case typename = "__typename"
    }
}

// MARK: - ReleaseDate
struct ReleaseDate: Codable {
    var month: Int?
    var year: Int
    var typename: String

    enum CodingKeys: String, CodingKey {
        case month, year
        case typename = "__typename"
    }
}

// MARK: - ReleaseYear
struct ReleaseYear: Codable {
    var year: Int
    var typename: ReleaseYearTypename

    enum CodingKeys: String, CodingKey {
        case year
        case typename = "__typename"
    }
}

enum ReleaseYearTypename: String, Codable {
    case yearRange = "YearRange"
}

// MARK: - TitleType
struct TitleType: Codable {
    var text: Text
    var id: ID
    var isSeries, isEpisode: Bool
    var typename: TitleTypeTypename

    enum CodingKeys: String, CodingKey {
        case text, id, isSeries, isEpisode
        case typename = "__typename"
    }
}

enum ID: String, Codable {
    case short = "short"
}

enum Text: String, Codable {
    case short = "Short"
}

enum TitleTypeTypename: String, Codable {
    case titleType = "TitleType"
}




class HomeViewModel {
    
    func fetchMovies() {
      
        let headers = [
            "X-RapidAPI-Key": "b59ca718c0mshbf4dc2387e658acp144565jsna827184f8165",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: HomeAPIEndpoint.titles.url,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if let data = data {
                    let movies = try? JSONDecoder().decode(MovieList.self, from: data)
                    print("Movies",movies)
                    let json = try? JSONSerialization.jsonObject(with: data)
                    print("JSON",json)
                    
                }
                print(httpResponse as Any)
            }
        })

        dataTask.resume()
    }
}
