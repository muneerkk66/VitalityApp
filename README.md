# Vitality App
## Your best is yet to come with Vitality insurance
Explore the visually striking statement card display to identify the current leader in total points on the table.

## Getting Started
### Environment Dependencies
- Xcode 15+
- iOS 16+
- SwiftUI
- Swift Package Manager(SPM) Dependencies
	- Relam(https://github.com/realm/realm-swift)
	- SwiftInj(https://github.com/Swinject/Swinject)
	- [Swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing)

  
### Project Setup
1. Clone the repository.
2. Finally, navigate to the root folder run Xcode
<br><br>

## Important Note on Unit test

**Please Note:** To execute unit tests, ensure that you run them twice to ensure all tests are accurately executed. I've employed the snapshot testing framework. We should only automatically record if no screenshot exists for this test. When running unit tests for the first time, ensure that you run them twice to generate the appropriate screens for UI testing.
**Test coverage: 82.8%** 


## How to use app
Access the application to view two sections: the initial card view showcases the current user data and allows you to locate your rank in the leaderboard table. Furthermore, you have the option to click on each item in the table to access additional details.

### App Video
![Alt text](README_FILES/App.gif?raw=true "Vitality App")

## Project Structure
iOS Project implemented with Clean Layered Architecture and MVVM-Coordinator pattern. 

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network)
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")

### Folder Structure

```markdown
📦VitalityApp
┣ 📂Application
┃ ┗ 📂DependencyInjection
┣ 📂Data
┃ ┣ 📂Mapper
┃ ┣ 📂Network
┃ ┣ 📂DataSource
┃ ┣ 📂Persistence
┃ ┗ 📂Repositories
┣ 📂Domain
┃ ┣ 📂Interfaces
┃ ┣ 📂Entities
┃ ┗ 📂UseCase
┣ 📂Presentation
┃ ┣ 📂ReusableViews
┃ ┣ 📂AppCoordinator
┃ ┣ 📂Screens
┃ ┃ ┣ 📂Home
┃ ┃ ┃ ┣ 📂Coordinator
┃ ┃ ┃ ┣ 📂ViewModels
┃ ┃ ┃ ┗ 📂Views
┗ 📜VitalityApp.swift => The app entry point.
```

* **VitalityApp**(iOS Project): This folder contains the resources, source files and all other miscellaneous files to build the iOS project. This folder is further branched into:
	 The app is completely written in SwiftUI/Combine.
	 
## Includes
* Statement screen with user point card view
* Leader Screen


## What needs to be improved ##
### Required
1. Revise the persistence logic during the integration of the API.

### Tools have the capacity to be incorporated.
 1. - [Arkana](https://github.com/rogerluan/arkana) is used to handle/manage/store project keys secretely.
Arkana requires the declaration of a YAML config file, named e.g. `.arkana.yml` that lists the keys (names) and an `.env` (e.g. `.env.arkana`) file that stores the values for the keys stored in the YAML file. Since the `.env.arkana` file contains the actual values of the secrets, it should be stored locally and never be checked-in to the repository (It has already been added to `.gitignore`).
2. - [SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool allowing to parse the app's various assets (including but not limited to xibs, storyboards, fonts, assets library, strings file, etc). This app is built to use SwiftGen to generate 3 kinds of compile-time constants related to:
3. - [SwiftLint](https://github.com/realm/SwiftLint/) is a tool that parses `swift` files, and output warnings when a code-smell is identified. Sometimes, SwiftLint outputs warnings for desired code, and in these cases the warnings may be disabled in code.
4. - [swift-dependencies](https://github.com/pointfreeco/swift-dependencies) A dependency management library inspired by SwiftUI's "environment. this will be the better alternative for swiftinj".  
