//
//  DetalhesFilmes.swift
//  desafio-createapi
//
//  Created by Turma02-14 on 16/07/25.
//

import SwiftUI

struct DetalhesFilmes: View {

    let livro: books

    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                AsyncImage(url: URL(string: livro.image)) { foto in
                    foto
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 200, maxHeight: 250)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .padding(.bottom, 10)

                Text(livro.titulo)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Autor(a): \(livro.autor)")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                Text(livro.descricao)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                   
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .ignoresSafeArea(.all)
            .navigationTitle(livro.titulo)
            .navigationBarTitleDisplayMode(.inline)
        }
            
        }
       
}

#Preview {
    DetalhesFilmes(livro: books(
        _id: "12cb0a2332b354d845cf3c8ed2a25c37",
        _rev: "1-acfb0cd633ca70c0f7dc139b6f44dea6",
        titulo: "A Metamorfose",
        descricao: "O caixeiro-viajante Gregor acorda metamorfoseado em um enorme inseto e percebe que tudo mudou e não só em sua vida, mas no mundo.",
        image: "https://m.media-amazon.com/images/I/715JOcuqSSL._SY522_.jpg",
        publicacao: 1915,
        autor: "Franz Kafka",
        genero: "Ficção, Novela"
    ))
}

