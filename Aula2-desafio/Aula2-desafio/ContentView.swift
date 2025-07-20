//
//  ContentView.swift
//  Aula2-desafio
//
//  Created by Turma02-14 on 03/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var distancia: Double = 0.0
    @State private var tempo: Double = 0.0
    @State private var resultado: Double = 0.0
    @State private var exibir = false
    @State private var imagem: String = "pergunta"
    @State private var cor: Color = .gray
    
    var body: some View {
        ZStack{
            
            cor
            
                .ignoresSafeArea()
            Image("\(imagem)")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width:200, height:200)
            
            

                
        
            
            VStack {
                Text("Digite a distância (km)")
                    .bold()
                
                
                TextField("0", value: $distancia, format: .number)
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(1000)
                            .multilineTextAlignment(.center)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                Text("Digite o tempo (h)")
                    .bold()
                TextField("0", value: $tempo, format: .number)
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(1000)
                            .multilineTextAlignment(.center)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
            
                Button("Calcular"){
                    exibir = true
                    if tempo > 0 {
                        resultado = (distancia / tempo)
                    }
                    if resultado >= 0 && resultado <= 9.9 {
                        imagem = "tartaruga"
                        cor = .cor1
                    }
                    if resultado >= 10 && resultado <= 29.9 {
                        imagem = "elefante"
                        cor = .cor2
                    }
                    if resultado >= 30 && resultado <= 69.9 {
                        imagem = "avestruz"
                        cor = .cor3
                    }
                    if resultado >= 70 && resultado <= 89.9 {
                        imagem = "leao"
                        cor = .cor4
                    }
                    if resultado >= 90 && resultado <= 130 {
                        imagem = "leao"
                        cor = .cor5
                    }
                    
                }
                .padding()
                .background(Color.black)
                .cornerRadius(350)
                .foregroundColor(.orange)
                
                if exibir {
                    VStack {
                        Text("Velocidade: \(resultado, specifier: "%.2f") km/h")
                            .padding(10)
                            .foregroundStyle(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.headline)
                    }
                    
                }
                
                   Spacer()
                VStack{
                    HStack{
                        Text("TARTARUGA (0 - 9.9km/h)")
                        Circle()
                            .fill(.cor1)
                            .frame(width: 20)
                    }
                    
                    HStack {
                        Text("ELEFANTE (10 - 29.9km/h)")
                        Circle()
                            .fill(.cor2)
                            .frame(width: 20)
                    }
         
                    HStack{
                        Text("AVESTRUZ (30 - 69.9km/h)")
                        Circle()
                            .fill(.cor3)
                            .frame(width: 20)
                    }
                    HStack{
                        Text("LEÃO (70 - 89.9km/h)")
                        Circle()
                            .fill(.cor4)
                            .frame(width: 20)
                        
                    }
                    HStack{
                        Text("GUEPARDO (90 - 130km/h)")
                        Circle()
                            .fill(.cor5)
                            .frame(width: 20)
                        
                    }
                        
                        
                }.background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxHeight: 250)
               

                
            }
            
        }
        
    }
}//contentview

#Preview {
    ContentView()
}
