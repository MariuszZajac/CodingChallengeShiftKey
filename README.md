# The Problem

Our providers in Dallas, TX need the ability to see nearby shifts available on the ShiftKey platform to plan their work week. Your goal is to build an interface that allows them to accomplish this.

## Details
In `CodingChallenge.xcodeproj`, use `ShiftsView.swift` to get started. Using an address of "Dallas, TX", display one week of nearby shifts that come back from the [Available Shifts API](https://bitbucket.org/shiftkeyllc/ios-coding-challenge/src/master/API-DOC.md) in a list. The shift cell should include information relevant to the provider and when tapped, it should present a modal that will display more information about the shift.

The submitted code should reflect what you feel represents your best work.

You should be prepared to talk about your solution in an interview setting.

To start working on the challenge, clone this repo onto your development machine. Commit your changes there and when finished, publish your repo on your public bitbucket or github account.

### Requirements ###

* Written in Swift using SwiftUI or UIKit.
* Fetches available shifts using the [Available Shifts API](https://bitbucket.org/shiftkeyllc/ios-coding-challenge/src/master/API-DOC.md) with an `address` of "Dallas, TX" and `type` of "4day"
* On app launch, the current week of shifts should be fetched and displayed, starting with today's date
* Tapping on a shift should present a shift details modal
* Use of 3rd party libraries is allowed. But, be thoughtful about which libraries are used and why

### What are we looking for? ###

* Solid architecture
* Use of design patterns
* Familiarity with mobile frameworks
* Testability
* Submit what you feel represents your best work
