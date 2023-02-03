#  ReadMe

This project is from Code With Chris IOS Foundations, Module 4 Challenge 6

Some things it uses in the Model:
1. class Model : ObservableObject
2. struct Person : Identifiable 

In the views:
1. @EnvironmentObject 
2. TabView
3. List
4. Toggle

It has no ViewModel file. The data is hard coded in the Model.

In the PeopleM4Ch6App.swift (the app launcher)
1. You must add .environmentObject(Model()) to ContentView oe else you will get an error
