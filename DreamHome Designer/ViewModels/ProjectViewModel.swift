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
import PhotosUI


final class ProjectViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var sortProjecttype = 0
    
    @Published var projects: [Project] = []
    @Published var interiorProject: [Project] = []
    @Published var exteriorProject: [Project] = []
    
    @Published var notesProject: [NoteProject] = []
    private var photosProject: [PhotoProject] = []
    
    @Published var simpleNoteText: String = ""
    @Published var simpleNoteTitle: String = ""
    @Published var simpleNote: NoteProject?
    @Published var isEditeNoteMode = false
    
    @Published var simplePhoto: UIImage = .logo
    
    @Published var simpleProject: Project?
    @Published var searchText: String = ""
    @Published var simpleNameProject = ""
    @Published var simpleStyle = Style.Other
    @Published var simpleType = TypeProject.Exterior
    @Published var isEditeProjectMode = false
    
    @Published var isPresentAddNote: Bool = false
    @Published var isPresentImage: Bool = false
    @Published var isPresentAddImage = false
    @Published var isPresentPhotoPicer = false
    
    
    @Published var simpleImage: PhotoProject?
    
    @Published private(set) var filteredProjects: [Project] = []
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchProjects()
        fetchNotesProject()
        fetchPhotoProject()
        sortedProjects()
    }
    
    
    //MARK: - Sotred function
    func getProjects() -> [Project] {
        sortedProjects()
        switch sortProjecttype {
            case 1: return exteriorProject
            case 2: return interiorProject
        default:
            return projects
        }
    }
    
    func sortedProjects(){
        interiorProject.removeAll()
        exteriorProject.removeAll()
        for project in projects {
            if project.type == TypeProject.Exterior.rawValue {
                exteriorProject.append(project)
            }else{
                interiorProject.append(project)
            }
        }
    }
    
    //MARK: - Edit data
    func editProjectData(){
        simpleProject?.name = simpleNameProject
        simpleProject?.style = simpleStyle.rawValue
        simpleProject?.type = simpleType.rawValue
        saveProject()
        isEditeProjectMode = false
        clearProjectData()
    }
    
    func editNoteData(){
        simpleNote?.title = simpleNoteTitle
        simpleNote?.text = simpleNoteText
        saveNoteProject()
        isEditeNoteMode = false
        isPresentAddNote = false
        clearNoteData()
    }
    
    //MARK: - Felldata
    func feelNoteData(note: NoteProject){
        simpleNoteText = note.text ?? ""
        simpleNoteTitle = note.title ?? ""
        simpleNote = note
        isEditeNoteMode = true
    }
    
    func feellProjectData(project: Project){
        simpleProject = project
        simpleNameProject = project.name ?? ""
        simpleStyle = Style(rawValue: project.style ?? "") ?? .Other
        simpleType = TypeProject(rawValue: project.type ?? "") ?? .Exterior
        isEditeProjectMode = true
    }
    
    //MARK: - Delete data
    func deleteNote(){
        if simpleNote != nil {
            manager.context.delete(simpleNote!)
            saveNoteProject()
            isPresentAddNote = false
        }
        
    }
    
    func deleteImage() {
        manager.context.delete(simpleImage!)
        savePhotoProject()
        isPresentImage = false
    }
    
    func deleteProject(project: Project) {
        if let imges = project.photo?.allObjects as? [PhotoProject] {
            for image in imges {
                manager.context.delete(image)
            }
            savePhotoProject()
        }
        if let notes = project.note?.allObjects as? [NoteProject] {
            for note in notes {
                manager.context.delete(note)
            }
            saveNoteProject()
        }
        manager.context.delete(project)
        saveProject()
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
        newNote.title = simpleNoteTitle
        newNote.project = project
        saveNoteProject()
        clearNoteData()
        isPresentAddNote = false
        
    }
    func addPhoto(project: Project) {
        let newPhoto = PhotoProject(context: manager.context)
        newPhoto.photo = simplePhoto
        newPhoto.project = project
        savePhotoProject()
        simplePhoto = .logo
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
         var simpleSortProject = getProjects()
        if searchText.isEmpty {
            filteredProjects = simpleSortProject
        }else {
            filteredProjects = simpleSortProject.filter {$0.name?.lowercased().hasPrefix(searchText.lowercased()) ?? false}
        }
    }
     
    //MARK: - Clear data
    func clearProjectData() {
        simpleNameProject = ""
        simpleType = .Exterior
        simpleStyle = .Other
        simpleProject = nil
    }
    func clearNoteData() {
        simpleNote = nil
        simpleNoteText = ""
        simpleNoteTitle = ""
    }
}
