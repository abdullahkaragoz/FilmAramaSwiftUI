//
//  FilmViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Abdullah Karagöz on 27.08.2022.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject {
    
    @Published var filmler = [Film]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi : String){
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    self.filmler = filmDizisi
                }
            }
            
            
        }
    }
}
