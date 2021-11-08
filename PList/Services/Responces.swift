import Foundation

struct CategoryResponse: Codable {
    let data: [Category]
}

struct ProductsResponse: Codable {
    let data: [Product]
}

struct ProductResponse: Codable {
    let data: Product
}

