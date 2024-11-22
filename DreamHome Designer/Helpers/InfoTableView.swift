//
//  InfoTableView.swift
//  DreamHome Designer
//
//  Created by Роман on 19.11.2024.
//

import SwiftUI

struct InfoTableView: View {
    @StateObject var vm: ProjectViewModel
    var body: some View {
        VStack {
            infoTableButtonView(text: "Added project", text2: "\(vm.projects.count)")
            HStack {
                infoTableButtonView(text: "Interiors", text2: "\(vm.interiorProject.count)")
                infoTableButtonView(text: "Exteriors", text2: "\(vm.exteriorProject.count)")
            }
            infoTableButtonView(text: "The notes are written", text2: "\(vm.notesProject.count)")
        }
    }
}

#Preview {
    InfoTableView(vm: ProjectViewModel())
}
