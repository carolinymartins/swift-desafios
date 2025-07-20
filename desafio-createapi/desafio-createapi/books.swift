//
//  books.swift
//  desafio-createapi
//
//  Created by Turma02-14 on 16/07/25.
//

import Foundation

struct books: Decodable, Hashable {
   
    let _id: String
    let _rev: String
    let titulo: String
    let descricao: String
    let image: String
    let publicacao: Double
    let autor: String
    let genero: String
}
