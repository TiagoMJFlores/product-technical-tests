
## App running

<p align="center">
  <img src="/challenges/appVideo.gif" width="350px" />
</p>

## Dependencies

*  Alamofire - Alamofire is a HTTP networking library written in Swift
*  Kingfisher  - Kingfisher is a library for downloading and caching images from the web


## Architecture

I chose the MVP-C architecture

Structure:

* View - UIKit related classes and UIViewController that implement the ViewReceiver protocols (used for Presenter to communicate to View)

* Presenter - Here are the presenters who implement the Delegate and DataSource Protocols

* Model - Here I put services, data models, network layer and classes that do data model manipulation

* Coordinator - Each feature contains a coordinator that is responsible for managing navigation between views and injecting dependencies in View and Presenter.

## Xcode project File Structure

* App -> SharedUIComponents - They contain UI components that can be shared among several Use Cases.

* App -> UseCases - Each UseCase contains a feature of the app. Each UseCase laso contains the MVP View and Presenter Layer. There are two UseCases: ListBoutiquesInfo and ShowMapLocations.

* Model - Contains the MVP Model Layer.

* Model -> Utils - Contain data handling classes. In this case a class that does geo reverse of the GPS location to show the address in a user friendly format for the user. 

* Model -> Network - Network layer built on an abstraction on Alamofire

##  Xcode project Disk Location

Please check the SampleApp in this directory and run the SampleApp.xcworkspace


* Model -> Services - Classes that interact with iOS services such as CoreLocation and external Maps. 

* Model -> DataModels - Contains the classes that store the data after the JSON deserialization. Implement the Codable protocol.



