//
//  ContentView.swift
//  desafio-createapi
//
//  Created by Turma02-14 on 16/07/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.library, id: \.self) { livros in
                    NavigationLink(destination: DetalhesFilmes(livro: livros)) {
                        HStack {
                            AsyncImage(url: URL(string: livros.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }

                            VStack {
                                Text(livros.titulo)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text(livros.genero)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical, 50)
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .navigationTitle("Biblioteca")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}



