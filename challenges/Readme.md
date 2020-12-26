## App running

<p align="center">
  <img width="300" src="/challenges/video.gif" width="100%" />
</p>

## Architecture

I chose the MVP architecture

Structure:

* View - UIKit related classes) and UIViewController that implement the ViewReceiver protocols (used for Presenter to communicate to View)

* Presenter - Here are the presenters who implement the Delegate and DataSource Protocols

* Model - Here I put services, data models, network layer and classes that do data model manipulation

## Dependencies

*  Alamofire
*  Kingfisher 
