//
//  NavigationModel.swift
//  SwiftUI4.0
//
//  Created by 金亮 on 2023/3/2.
//
import Foundation
import SwiftUI



// MARK: - AppRankM
struct AppRankM: Decodable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Decodable {
    let author: Author
    let entry: [AppRank]
    let icon, id: Title
    let link: [FeedLink]
    let rights, title, updated: Title
}

// MARK: - Author
struct Author: Decodable {
    let name, uri: Title
}

// MARK: - Title
struct Title: Decodable {
    let label: String
}

// MARK: - Entry
struct AppRank: Decodable {
    let category: Category
    let id: ID
    let imArtist: IMArtist
    let imContentType: IMContentType
    let imImage: [IMImage]
    let imName: Title
    let imPrice: IMPrice
    let imReleaseDate: IMReleaseDate
//    let link: [EntryLink]
    let summary: Title?
    let rights: Title?
    let title: Title
    
    //替换自定义键值名
     enum CodingKeys: String, CodingKey {
         case category, id, rights, summary, title//, link
         case imArtist = "im:artist"
         case imContentType = "im:contentType"
         case imImage = "im:image"
         case imName = "im:name"
         case imPrice = "im:price"
         case imReleaseDate = "im:releaseDate"
     }
}

         
// MARK: - Category
struct Category: Decodable {
    let attributes: CategoryAttributes
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Decodable {
    let imID, label: String
    let scheme: String
    let term: String
    
    //自定义键值名
     enum CodingKeys: String, CodingKey {
        case label, scheme, term
        case imID = "im:id" //关键字替换
    }
}

// MARK: - ID
struct ID: Decodable {
    let attributes: IDAttributes
    let label: String
}

// MARK: - IDAttributes
struct IDAttributes: Decodable {
    let imBundleID, imID: String
    
    // 自定义键值名
     enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case imBundleID = "im:bundleId"
    }
}

// MARK: - IMArtist
struct IMArtist: Decodable {
    let attributes: IMArtistAttributes?
    let label: String
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Decodable {
    let href: String
}

// MARK: - IMContentType
struct IMContentType: Decodable {
    let attributes: IMContentTypeAttributes
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Decodable {
    let label, term: String
}

// MARK: - IMImage
struct IMImage: Decodable {
    let attributes: IMImageAttributes
    let label: String
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Decodable {
    let height: String
}

// MARK: - IMPrice
struct IMPrice: Decodable {
    let attributes: IMPriceAttributes
    let label: String
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Decodable {
    let amount, currency: String
}

// MARK: - IMReleaseDate
struct IMReleaseDate: Decodable {
    let attributes: Title
    let label: String
}

// MARK: - EntryLink
struct EntryLink: Decodable {
    let attributes: PurpleAttributes
    let imDuration: Title?
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Decodable {
    let href: String
    let rel, type: String
    let imAssetType, title: String?
}

// MARK: - FeedLink
struct FeedLink: Decodable {
    let attributes: FluffyAttributes
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Decodable {
    let href: String
    let rel: String
    let type: String?
}


