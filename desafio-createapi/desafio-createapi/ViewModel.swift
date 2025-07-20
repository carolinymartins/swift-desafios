//
//  ViewModel.swift
//  desafio-createapi
//
//  Created by Turma02-14 on 16/07/25.
//

import Foundation

class ViewModel: ObservableObject {

    @Published var library: [books] = []

    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/leituraCarol") else {
            return }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in

            guard let data = data, error == nil else {
                return
            }

            do {
                let parsed = try JSONDecoder().decode([books].self, from: data)

                DispatchQueue.main.async {
                    self?.library = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
