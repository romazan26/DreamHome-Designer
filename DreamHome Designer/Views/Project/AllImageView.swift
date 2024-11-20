//
//  AllImageView.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI

struct AllImageView: View {
    @ObservedObject var project: Project
    @StateObject var vm: ProjectViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AllImageView(project: Project(), vm: ProjectViewModel())
}
