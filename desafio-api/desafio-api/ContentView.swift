//
//  ContentView.swift
//  desafio-api
//
//  Created by Turma02-14 on 14/07/25.
//
import SwiftUI
import Charts

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var mostrarDetalhes = false
    @State private var moedaSelecionada: cripto?

    var body: some View {
        NavigationView {
            List(viewModel.criptos) { coin in
                VStack(alignment: .center) {
                    Button(action: {
                        self.mostrarDetalhes = true
                        self.moedaSelecionada = coin
                    }) {
                        VStack {
                            AsyncImage(url: URL(string: coin.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 200, maxHeight: 200)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .sheet(isPresented: $mostrarDetalhes) {
                        if let selecionada = moedaSelecionada {
                            SheetView(moeda: selecionada)
                        }
                    }

                    Text(coin.name)
                        .font(.headline)

                    HStack {
                        Text("Valor Atual:")
                        Spacer()
                        Text("$\(coin.current_price, specifier: "%.2f")")
                            .fontWeight(.bold)
                    }
                    HStack {
                        Text("Crescimento % (24 h):")
                        Spacer()
                        Text("\(coin.price_change_percentage_24h, specifier: "%.2f")%")
                    }
                }
            }
            .navigationTitle("CRIPTOS")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct SheetView: View {
    let moeda: cripto
    
    var body: some View {
        ZStack{
            Color.cor1
                .ignoresSafeArea()
            
            
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: moeda.image)) { foto in
                    foto
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .padding(.top, 20)
                
                Text(moeda.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(moeda.symbol.uppercased())
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                Divider()
                
                HStack {
                    Text("Preço Atual:")
                        .font(.headline)
                    Spacer()
                    Text("$\(moeda.current_price, specifier: "%.2f")")
                        .font(.headline)
                }
                
                Divider()
                
                HStack {
                    Text("Mudança (24h):")
                        .font(.subheadline)
                    Spacer()
                    Text("$\(moeda.price_change_24h, specifier: "%.2f") (\(moeda.price_change_percentage_24h, specifier: "%.2f")%)")
                        .font(.subheadline)
                        .foregroundColor(moeda.price_change_percentage_24h >= 0 ? .green : .red)
                }
                
                HStack {
                    Text("Máxima (24h):")
                        .font(.subheadline)
                    Spacer()
                    Text("$\(moeda.high_24h, specifier: "%.2f")")
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Mínima (24h):")
                        .font(.subheadline)
                    Spacer()
                    Text("$\(moeda.low_24h, specifier: "%.2f")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack {
                    Text("Capitalização de Mercado:")
                        .font(.subheadline)
                    Spacer()
                    Text("$\(moeda.market_cap, specifier: "%.0f")")
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Volume Total (24h):")
                        .font(.subheadline)
                    Spacer()
                    Text("$\(moeda.total_volume, specifier: "%.0f")")
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(10)
            .ignoresSafeArea()
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}
