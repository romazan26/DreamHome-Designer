//
//  AddNoteView.swift
//  DreamHome Designer
//
//  Created by Роман on 21.11.2024.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var vm: ProjectViewModel
    @FocusState var isFocused: Bool
    let project: Project
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                //MARK: - text of note
                HStack {
                    MultiLineTF(txt: $vm.simpleNoteTitle, placehold: "Note title")
                        .focused($isFocused)
                    MultiLineTF(txt: $vm.simpleNoteText, placehold: "Materials for the house")
                        .focused($isFocused)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 192)
                .padding()
                .background {
                    Color.black.cornerRadius(20)
                }
                
                //MARK: - button group
                HStack {
                    if vm.isEditeNoteMode {
                        //MARK: Dellete button
                        Button {
                            vm.deleteNote()
                        } label: {
                            Image(systemName: "trash.square.fill")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .foregroundStyle(.red)
                        }
                    }else{
                        Button {
                            vm.isPresentAddNote = false
                        } label: {
                            Image(systemName: "xmark.octagon.fill")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .foregroundStyle(.gray)
                        }
                    }
                    

                    
                    Button {
                        if vm.isEditeNoteMode {
                            vm.editNoteData()
                        }else{
                            vm.addNote(project: project)
                        }
                        
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.green)
                    }

                }
            }
        }.onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    AddNoteView(vm: ProjectViewModel(), project: Project())
}
