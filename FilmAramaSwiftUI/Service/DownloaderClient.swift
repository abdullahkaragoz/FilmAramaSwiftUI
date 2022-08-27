//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Abdullah Karagöz on 27.08.2022.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir (search: String, completion: @escaping(Result<[Film]?,DownloaderError >)-> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=832e5738")
        else
        {
            return completion(.failure(.yanlisUrl))
        }
         
        URLSession.shared.dataTask(with: url) { data,response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabi.filmler))
        }.resume()
    }
}

enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
