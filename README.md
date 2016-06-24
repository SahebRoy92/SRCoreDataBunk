# SRCoreDataBunk

This repository contains Examples on simple and complex Core data Functions and design patterns, containing helper classes that would help in making complex operations simple and in a more modular way.

**SRCoreDataSingleton**
An abstract Core Data stack singleton class that has capabilities of - 
* Lightweight migration
* Auto creation of PSC when store does not matches, while previous store is moved without data loss.


**SRCoreDataManager**
A Core Data manager class that can - 
* Perform FIFO structure operations in Async way, in background without freezing UI or blocking Main thread.
* This Class as performs operations in FIFO order in a single background queue, it also prevents deadlock.
