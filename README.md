# Objective-C SDK
[![Build Status](https://travis-ci.org/optimizely/objective-c-sdk.svg?branch=master)](https://travis-ci.org/optimizely/objective-c-sdk/)
[![Apache 2.0](https://img.shields.io/github/license/nebula-plugins/gradle-extra-configurations-plugin.svg)](http://www.apache.org/licenses/LICENSE-2.0)

This repository houses the Objective-C SDK for Optimizely X Mobile.

## Getting Started

### Using the SDK

See the Optimizely X Mobile [developer documentation](https://developers.optimizely.com/x/solutions/sdks/reference/index.html?language=objectivec) to learn how to set
up your first project and start using the SDK.

### Requirements
* iOS 8.0+ / tvOS 9.0+
* [JSONModel](https://github.com/jsonmodel/jsonmodel)
* [FMDB](https://github.com/ccgus/fmdb)

### Installing the SDK
 
Please note below that _\<platform\>_ is used to represent the platform on which you are building your app. Currently, we support ```iOS``` and ```tvOS``` platforms.

#### Cocoapod 
1. Add the following line to the _Podfile_:<pre>pod 'OptimizelySDK\<platform\>'</pre>

2. Run the following command: <pre>``` pod install ```</pre>

Further installation instructions for Cocoapods: https://guides.cocoapods.org/using/getting-started.html

#### Carthage
1. Add the following lines to the _Cartfile_:<pre> 
github "optimizely/objective-c-sdk"
github "jsonmodel/jsonmodel"
github "ccgus/fmdb"
</pre>

2. Run the following command:<pre>```carthage update```</pre>

3. Link the frameworks to your project. Go to your project target's **Link Binary With Libraries** and drag over the following from the _Carthage/Build/\<platform\>_ folder: <pre> 
      FMDB.framework
      JSONModel.framework
      OptimizelySDKCore.framework
      OptimizelySDKDatafileManager.framework
      OptimizelySDKEventDispatcher.framework
      OptimizelySDKShared.framework
      OptimizelySDKUserProfile.framework<
      OptimizelySDK\<platform\>.framework</pre>

4. To ensure that proper bitcode-related files and dSYMs are copied when archiving your app, you will need to install a Carthage build script:
      - Add a new **Run Script** phase in your target's **Build Phase**.</br>
      - In the script area include:<pre>
      ```/usr/local/bin/carthage copy-frameworks```</pre> 
      - Add the frameworks to the **Input Files** list:<pre>
            ```$(SRCROOT)/Carthage/Build/<platform>/FMDB.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/JSONModel.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDKCore.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDKDatafileManager.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDKEventDispatcher.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDKShared.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDKUserProfile.framework```
            ```$(SRCROOT)/Carthage/Build/<platform>/OptimizelySDK<platform>.framework```</pre>

Futher installation instructions for Carthage: https://github.com/Carthage/Carthage

#### Manual Installation

The universal framework can be used in an application without the need for a third-party dependency manager. The universal framework packages up all Optimizely X Mobile modules, which include:<pre>
	```OptimizelySDKCore```
	```OptimizelySDKShared```
	```OptimizelySDKDatafileManager```
	```OptimizelySDKEventDispatcher```
	```OptimzielySDKUserProfile```</pre>

The framework also embeds its third-party dependencies:<pre>
	```FMDB```
	```JSONModel```</pre>

The universal framework for iOS includes builds for the following architectures:<pre>
	```i386```
	```X86_64```
	```ARMV7```
	```ARMV7s```
	```ARM64```</pre>

The universal framework for tvOS includes build for the following architectures:<pre>
	```X86_64```
	```ARM64```</pre>

Bitcode is enabled for both the iOS and tvOS universal frameworks. 

In order to install the universal framework, follow the steps below:

1. Download the [iOS](https://github.com/optimizely/objective-c-sdk/tree/master/OptimizelySDKUniversal/generated-frameworks/Release-iOS-universal-SDK/OptimizelySDKiOS.framework) or [tvOS](https://github.com/optimizely/objective-c-sdk/tree/master/OptimizelySDKUniversal/generated-frameworks/Release-tvOS-universal-SDK/OptimizelySDKTVOS.framework) framework.

2. Drag the framework to your project in Xcode, this should prompt you to select a target. Go to **Build Phases** and make sure that the framework is under the **Link Binary with Libraries** section.
 
3. Go to **Build Phases** and in the **Embed Frameworks** section add the framework.

4. The Apple store will reject your app if you have the universal framework installed as it includes simulator binaries. Therefore, a script to strip the extra binaries needs to be run before you upload the app. To do this, go to **Build Settings** and add a **Run Script** section. Copy and paste the following script:
	 ```
	FRAMEWORK="<FRAMEWORK_NAME>"
	FRAMEWORK_EXECUTABLE_PATH="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$FRAMEWORK.framework/$FRAMEWORK"
	EXTRACTED_ARCHS=()
	for ARCH in $ARCHS
	do
		lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
		EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
	done
	lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
	rm "${EXTRACTED_ARCHS[@]}"
	rm "$FRAMEWORK_EXECUTABLE_PATH"
	mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
	```
Make sure you replace the ```<FRAMEWORK_NAME>``` with the proper framework name!

If you choose to build the universal framework yourself, you can do so by running the ```OptimizelySDKiOS-Universal``` or ```OptimizelySDKTVOS-Universal``` schemes. The frameworks are output in the **OptimizelySDKUniversal/generated-frameworks** folder.

### Contributing
Please see [CONTRIBUTING](CONTRIBUTING.md).

