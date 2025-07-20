//
//  ViewModel.swift
//  desafio-api
//
//  Created by Turma02-14 on 14/07/25.
//

import Foundation

class ViewModel: ObservableObject {

    @Published var criptos: [cripto] = []

    func fetch() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page") else {
            return }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in

            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode([cripto].self, from: data)

                DispatchQueue.main.async {
                    self?.criptos = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


