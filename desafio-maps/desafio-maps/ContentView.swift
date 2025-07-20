//
//  ContentView.swift
//  desafio-maps
//
//  Created by Turma02-14 on 08/07/25.
//

import SwiftUI

import MapKit //importa a biblioteca do mapa

struct lugares: Hashable,Identifiable {

let id = UUID()
let nome: String
let foto: String
let descricao: String
let latitude: Double
let longitude: Double

}


struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -23.56610675748433, longitude: -46.67959021534329),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5) // Zoom inicial
    )
    @State private var lugarSelecionado: lugares? //lugar selecionado para o picker
    @State private var mostrarDetalhes = false //sheet view
    
    
    let lugaresArray = [
        lugares(nome: "LASAI", foto: "https://viagemeturismo.abril.com.br/wp-content/uploads/2016/10/lasai.jpeg", descricao: "Jantar neste restaurante, com apenas 10 assentos, é como assistir a um espetáculo, mas com a sensação de que… está na primeira fila! A cozinha, silenciosa no início, torna-se vibrante à medida que começam a trabalhar e criam-se interações constantes entre o chef Rafa Costa e Silva e os comensais. O menu degustação surpresa inicia com diversos aperitivos, onde os vegetais são protagonistas evidentes — exibidos em uma bandeja de madeira iluminada por um holofote no balcão — e servidos em diferentes formatos e texturas. Produzidos de forma ecológica consoante a estação, os vegetais provêm, majoritariamente, das hortas do chef em Itanhangá e no Vale das Videiras. Há inclusive a possibilidade de harmonização de vinhos, conduzida pela experiente Maíra Freire. O que significa Lasai? 'Tranquilo' em euskera, e faz alusão ao período de formação do chef no premiado Mugaritz (Errentería, Espanha). É preciso fazer reserva e ser pontual, pois todos os clientes iniciam a experiência ao mesmo tempo!", latitude: -22.953041336281384, longitude: -43.19633286090089),
        lugares(nome: "TUJU", foto: "https://f.i.uol.com.br/fotografia/2023/09/20/1695253083650b825bbc37c_1695253083_3x2_rt.jpg", descricao: "Quer viver uma grande experiência culinária? A poucos metros do Museu da Casa Brasileira (MCB), em uma rua tranquila do Jardim Paulistano, abre as portas o novo Tuju, instalado em um elegante edifício de três andares que vive por e para a gastronomia. A entrada é realizada pelo térreo, no qual a experiência se inicia com pequenas entradas, onde se encontra tanto a adega como um jardim interno; no segundo andar está o restaurante de fato, com uma grande cozinha aberta cercada por mesas, e no terceiro andar um grande bar com vista. O chef Ivan Ralston, bem apoiado por uma grande equipe de cozinheiros, aposta pela gastronomia em um sentido profundo, onde utiliza o seu conhecimento para combinar produtos e sabores brasileiros sazonais (sobretudo paulistas) com as mais modernas técnicas da Europa, sempre com ênfase na criatividade e no trabalho de investigação oculto. Cada estação, com suas características climatológicas, define um menu degustação!", latitude: -23.58023382029144, longitude: -46.68580634554243),
        lugares(nome: "ORO", foto: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/3c/be/31/first-floor.jpg?w=900&h=500&s=1", descricao: "Um daqueles restaurantes que todo gastrônomo deveria conhecer! A sintonia entre o chef Felipe Bronze e a sommelier Cecilia Aldaz funciona maravilhosamente bem e se evidencia em cada detalhe. Nesse encantador e elegante espaço, a uma quadra da praia do Leblon, a proposta busca fusionar as raízes brasileiras com a gastronomia de vanguarda, refletida nos menus Afetividade e Criatividade (com dois ou quatro pratos principais, respectivamente), que visam homenagear as diferentes regiões do país. No balcão diante da cozinha, com capacidade para quatro comensais, é possível apreciar o movimento sincronizado dos cozinheiros e a preparação dos pratos sobre o fogo — elemento principal da casa. O que nos chamou a atenção? Acima de tudo, a criatividade das entradas, como a magnífica Ostra coberta com granizado de goiaba e leve toque de pimenta biquinho, ou a seleção posterior de petiscos para comer com as mãos, alguns crocantes, outros brasileiros e vários de inspiração nipônica.", latitude: -22.985791154805835, longitude: -43.22483144740739),
        lugares(nome: "D.O.M", foto: "https://www.theworlds50best.com/discovery/filestore/jpg/DOM-SaoPaulo-Brazil-02.jpg", descricao: "Uma proposta gastronômica única? Alex Atala, o chef brasileiro de maior renome internacional, demonstra que, ao estar imerso em vários projetos, sempre tem algo para contar. A experiência, que é apresentada em um único menu degustação que comemora os seus 25 anos (há também uma opção vegetariana), nos leva pela mão aos sabores da Amazônia, das comunidades ribeirinhas e dos cultivos de pequenos produtores locais em uma sucessão de matérias-primas quase desconhecidas (raízes de priprioca, palmito pupunha, formigas, jambu, tucupi...), sabores e texturas surpreendentes que cativam o paladar, trabalhados de maneira criativa que toma como base algumas combinações próprias da cultura culinária europeia. Neste restaurante moderno e elegante, decorado com objetos indígenas, encontrará pratos como o Feijão andu com mocotó e beiju (representando uma parte importante da história nordestina), Peixe cozido em folha de bananeira elaborado com técnicas kayapó... Abra sua mente e deixe-se surpreender!", latitude: -23.566066715015168, longitude: -46.6674649116418),
        lugares(nome: "EVVAI", foto: "https://vejasp.abril.com.br/wp-content/uploads/2017/06/evvai-cortada.jpg?quality=70&strip=info&w=924&w=636", descricao: "Não é frequente encontrar um restaurante que expresse verdadeiramente o desejo e a paixão do chef pela comida, pela vida e pela natureza, porém no Evvai... é exatamente isso que você irá encontrar! A proposta do chef Luiz Filipe Souza, que fusiona com sucesso diferentes influências brasileiras e italianas, resulta em pratos que não são apenas esteticamente atraentes, mas também repletos de habilidade, conhecimento e equilíbrio. A oferta é apresentada em um único menu degustação chamado Oriundi (que simboliza o intercâmbio de culturas), conta com entradas delicadas que remetem às cores das bandeiras do Brasil e da Itália. Seguido pela Bomba al nero / Lardo da Serra da Bocaina, um prato impressionante que, de uma forma ou outra, está sempre presente no menu, e no momento da sobremesa, uma proposta que exalta o mel Melipona, elaborado por abelhas nativas brasileiras. Cada prato é acompanhado por um chamativo cartão, desenhado pelo próprio chef, detalhando a história por trás do prato!", latitude:-23.566836229280046, longitude: -46.67902567437856)
        
    ]
    
    var body: some View{
        ZStack {
            Map(coordinateRegion: $region, annotationItems: lugaresArray) { lugar in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: lugar.latitude, longitude: lugar.longitude)) {
                    Button(action: {
                        self.lugarSelecionado = lugar // Define o lugar selecionado
                        self.mostrarDetalhes = true   // Ativa a exibição da sheet
                    }) {
                        VStack{
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                                .background(Color.white)
                                .clipShape(Circle())
                            Text(lugar.nome)
                                .font(.caption2)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding(5)
                        }
            
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $mostrarDetalhes) { //passa para a sheet view
                if let lugar = lugarSelecionado {
                    SheetView(lugar: lugar)
                }
            }
            
            
            //picker
            VStack {
                Picker("Selecione um Lugar", selection: $lugarSelecionado) {
                    Text("Nenhum").tag(nil as lugares?)
                    ForEach(lugaresArray) { lugar in
                        Text(lugar.nome).tag(lugar as lugares?) //molda o objeto lugar para o tipo lugares?
                    }
                }
                .pickerStyle(.menu)
                .foregroundColor(.white)
                .frame(maxHeight: 20)
                .padding()
                .font(.headline)
                .background(Color.picker)
                .cornerRadius(10)
                .padding(.top, 20) //topo da tela
                .onChange(of: lugarSelecionado) { valorNovo in   //muda conforme o valor selecionado
                    if let lugar = valorNovo {
                        withAnimation {
                            region = MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: lugar.latitude, longitude: lugar.longitude), //muda a região conforme o picker
                                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                            )
                        }
                    }
                }
                
                Spacer() // Empurra o picker para o topo
               
                Text("Restaurantes com estrela michelin")
                    .frame(maxHeight: 20)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding()
                    .font(.headline)
                    .background(Color.picker)
                    .cornerRadius(10)
            } //fim do vstack
        } //fim do zstack
        
    } //fim do body
    
}
    #Preview {
        
        ContentView()
        
    }
    
    struct SheetView: View{
        let lugar: lugares //recebe o lugar selecionado
        
        var body: some View{
            VStack{
                AsyncImage(url: URL(string: lugar.foto)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 200, maxHeight: 250) // Limita altura
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView() //placeholder do async
                }
                .padding(.bottom, 10)
                
                Text(lugar.nome)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(lugar.descricao)
                    .font(.caption)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                    
                
            }
            .padding()
            .background(Color.white)
        }
    }

