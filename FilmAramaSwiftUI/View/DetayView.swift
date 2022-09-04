//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Abdullah Karagöz on 3.09.2022.
//

import SwiftUI

struct DetayView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
          
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
         
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Plot").padding()
        
            Text(filmDetayViewModel.filmDetayi?.director ?? "Director").padding()
            
            Text(filmDetayViewModel.filmDetayi?.writer ?? "Writer").padding()
            
            Text(filmDetayViewModel.filmDetayi?.awards ?? "Awards").padding()
            
            Text(filmDetayViewModel.filmDetayi?.year ?? "Year").padding()
           
            Spacer()
        }.onAppear(perform: {
            self.filmDetayViewModel
                .filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
