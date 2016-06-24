# SRCoreDataBunk

This repository contains Examples on simple and complex Core data Functions and design patterns
**SRCoreDataSingleton**
This repo has an abstract Core Data stack singleton class that has capabilities of - 
* Lightweight migration
* Auto creation of PSC when store does not matches, while previous store is moved without data loss.


**SRCoreDataManager**
This repo also has another Core Data manager class that can - 
* Perform FIFO structure operations in Async way, in background without freezing UI or blocking Main thread.
* This Class as performs operations in FIFO order in a single background queue, it also prevents deadlock.
