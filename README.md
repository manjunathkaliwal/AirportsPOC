# AirPortPOC
AirPortPOC

Most Popular Airports 

Description
A simple iOS Native app developed in Swift to hit the Most Popular airports API and show a list of Cities, that shows details when items on the list are tapped (a typical master/detail app).

Demonstrations

Covers the following:

	•	  Object Oriented Programming Approach
	•	  MVVM Approach
	•	  Unit Tests
	•	  Simple UI Test by Record UI Test
	•	  Generic and simple code

App Features:

	•	  SingleView applciation
	•	  Auto layout with Dynamic Cell Resizing
	•	  Dynamic Time Period Configuration


To build using xcodebuild without code signing

	xcodebuild clean build -workspace "AirPortPOC.xcworkspace" -scheme "AirPortPOC" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

Tests :

To run tests using xcodebuild.

	xcodebuild -workspace "AirPortPOC.xcworkspace" -scheme "AirPortPOC" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS 10.3' test
