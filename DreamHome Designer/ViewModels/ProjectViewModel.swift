//
//  ProjectViewModel.swift
//  DreamHome Designer
//
//  Created by Роман on 20.11.2024.
//

import SwiftUI
import CoreData
import Combine
import UIKit


final class ProjectViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var projects: [Project] = []
    private var notesProject: [NoteProject] = []
    private var photosProject: [PhotoProject] = []
    
    @Published var simpleNoteText: String = ""
    @Published var simplePhoto: UIImage? = nil
    @Published var searchText: String = ""
    @Published var simpleNameProject = ""
    @Published var simpleStyle = Style.Other
    @Published var simpleType = TypeProject.Exterior
    
    @Published private(set) var filteredProjects: [Project] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchProjects()
        fetchNotesProject()
        fetchPhotoProject()
    }
    
    //MARK: - Add Data
    func addProject() {
        let newProject = Project(context: manager.context)
        newProject.name = simpleNameProject
        newProject.style = simpleStyle.rawValue
        newProject.type = simpleType.rawValue
        saveProject()
        clearProjectData()
    }
    func addNote(project: Project) {
        let newNote = NoteProject(context: manager.context)
        newNote.text = simpleNoteText
        newNote.project = project
        saveNoteProject()
        simpleNoteText = ""
    }
    func addPhoto(project: Project) {
        let newPhoto = PhotoProject(context: manager.context)
        newPhoto.photo = simplePhoto
        newPhoto.project = project
        savePhotoProject()
        simplePhoto = nil
    }
    
    
    //MARK: - CoreData function
    func fetchNotesProject() {
        let request = NSFetchRequest<NoteProject>(entityName: "NoteProject")
        do {
            notesProject = try manager.context.fetch(request)
        } catch {
            print("Error fetching notes: \(error)")
        }
    }
    func fetchProjects() {
        let request = NSFetchRequest<Project>(entityName: "Project")
        do {
            projects = try manager.context.fetch(request)
            setupFilteredProjects()
        } catch {
            print("Error fetching projects: \(error)")
        }
    }
    func fetchPhotoProject(){
        let request = NSFetchRequest<PhotoProject>(entityName: "PhotoProject")
        do {
            photosProject = try manager.context.fetch(request)
        } catch {
            print("Error fetching photo: \(error)")
        }
    }
    
    func saveProject() {
        projects.removeAll()
        manager.save()
        fetchProjects()
    }
    func saveNoteProject() {
        notesProject.removeAll()
        manager.save()
        fetchNotesProject()
    }
    func savePhotoProject() {
        photosProject.removeAll()
        manager.save()
        fetchPhotoProject()
    }
    
    //MARK: - Search function
    private func setupFilteredProjects() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
            self?.searchText = searchText
            self?.filterProjects()
        }.store(in: &cancellables)
    }
    
    private func filterProjects() {
        if searchText.isEmpty {
            filteredProjects = projects
        }else {
            filteredProjects = projects.filter {$0.name?.lowercased().hasPrefix(searchText.lowercased()) ?? false}
        }
    }
     
    //MARK: - Clear data
    func clearProjectData() {
        simpleNameProject = ""
        simpleType = .Exterior
        simpleStyle = .Other
    }
}
