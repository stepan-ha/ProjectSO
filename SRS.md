# Software Requirements Specification
## For ProjectSO

Version 1.2
Prepared by Stepan Halaiko & Oles Pankiv

16.10.2024

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Introduction](#1-introduction)
  * 1.1 [Document Purpose](#11-document-purpose)
  * 1.2 [Product Scope](#12-product-scope)
  * 1.3 [Definitions, Acronyms and Abbreviations](#13-definitions-acronyms-and-abbreviations)
  * 1.4 [References](#14-references)
  * 1.5 [Document Overview](#15-document-overview)
* 2 [Product Overview](#2-product-overview)
  * 2.1 [Product Perspective](#21-product-perspective)
  * 2.2 [Product Functions](#22-product-functions)
  * 2.3 [Product Constraints](#23-product-constraints)
  * 2.4 [User Characteristics](#24-user-characteristics)
  * 2.5 [Assumptions and Dependencies](#25-assumptions-and-dependencies)
  * 2.6 [Apportioning of Requirements](#26-apportioning-of-requirements)
* 3 [Requirements](#3-requirements)
  * 3.1 [Actors](#31-actors)
    * 3.1.1 [User](#311-user)
    * 3.1.2 [Admin](#312-admin)
    * 3.1.3 [Courier](#313-courier)
  * 3.2 [Functional](#32-functional)
  * 3.3 [Quality of Service](#33-quality-of-service)
    * 3.3.1 [Performance](#331-performance)
    * 3.3.2 [Security](#332-security)
    * 3.3.3 [Reliability](#333-reliability)
    * 3.3.4 [Availability](#334-availability)
  * 3.4 [Compliance](#34-compliance)
  * 3.5 [Design and Implementation](#35-design-and-implementation)
    * 3.5.1 [Installation](#351-installation)
    * 3.5.2 [Distribution](#352-distribution)
    * 3.5.3 [Maintainability](#353-maintainability)
    * 3.5.4 [Reusability](#354-reusability)
    * 3.5.5 [Portability](#355-portability)
    * 3.5.6 [Cost](#356-cost)
    * 3.5.7 [Deadline](#357-deadline)
    * 3.5.8 [Proof of Concept](#358-proof-of-concept)
  * 3.6 [Non-functional](#36-non-functional-requirements)
    * 3.6.1 [System requirements](#361-system-requirements)
    * 3.6.2 [Security requirements](#362-security-requirements)
* 4 [Verification](#4-verification)
* 5 [Appendixes](#5-appendixes)

## Revision History
| Name            | Date        |  Version   |
| --------------- | ----------- |  --------- |
| Stepan Halaiko  | 16.10.2024  |  1.0       |
| Oles Pankiv     | 17.10.2024  |  1.1       |
| Stepan Halaiko  | 18.10.2024  |  1.2       |
|                 |             |            |

## 1. Introduction

### 1.1 Document Purpose

The purpose of this Software Requirements Specification (SRS) document is to define and outline the functional and non-functional requirements for the "ProjectSO" software system. This document serves as a communication tool for all stakeholders, including project managers, developers, and clients, ensuring a common understanding of the system's objectives and scope. It provides a reference for development, validation, and change management, facilitating a clear and efficient software development process.

### 1.2 Product Scope
The product is an Internet Shop that features a user-friendly website and a desktop application, designed to facilitate online shopping and enhance the customer experience. Key functionalities include:

* Product Catalog: A comprehensive display of available products, with detailed descriptions, pricing, and images.
* Shopping Cart: A feature allowing users to add, remove, and modify products before checkout.
* Order Management: Users can track their purchase delivery in real-time via an integrated live map feature, providing updates on the delivery status and estimated arrival times.
* Salesforce Integration: The system connects with Salesforce through an API, ensuring seamless management of customer data, order processing, and inventory tracking.
* User Accounts: Customers can create and manage their accounts to view order history, manage payment methods, and save preferences.

The scope of this project does not include features such as in-store pickup or third-party marketplace integrations. The focus is on delivering a robust online shopping experience with efficient order tracking and management capabilities.

### 1.3 Definitions, Acronyms and Abbreviations

* API: Application Programming Interface - A set of rules and protocols for building and interacting with software applications, allowing different systems to communicate with each other.
* CRM: Customer Relationship Management - A technology for managing a company's relationships and interactions with potential and current customers.
* UI: User Interface - The means by which a user interacts with a computer or application, encompassing layout, design, and usability.
* SRS: Software Requirements Specification - A document that specifies the requirements of a software system, serving as a guide for development and validation.
* SKU: Stock Keeping Unit - A unique identifier for each distinct product and service that can be purchased.
* Live Map: A real-time mapping feature that provides users with current location tracking and delivery updates.
* User Account: A personalized profile created by customers to manage their shopping preferences, order history, and payment methods.

### 1.4 References

* IEEE Standard for Software Requirements Specifications - IEEE Std 830-1998.
* [Salesforce API Documentation - Salesforce Developer Documentation, Salesforce API Overview.](https://developer.salesforce.com/docs/apis)
* [User Interface Design Guidelines: 10 Rules of Thumb.](https://www.interaction-design.org/literature/article/user-interface-design-guidelines-10-rules-of-thumb)
* [LWC Documentation.](https://developer.salesforce.com/docs/platform/lwc/guide/get-started-component-library.html)
* [Criteria for the Internet Shop System](https://ecommerceinstitut.de/criteria-internet-shop-system/)

### 1.5 Document Overview
This Software Requirements Specification (SRS) document outlines the requirements for the Internet Shop software system. It is structured to provide a clear understanding of the system's functionalities, scope, and interfaces.

* Introduction - Provides the purpose, scope, definitions, acronyms, and references related to the project.
* Product Overview - Describes the product perspective, key features, user classes, and operating environment.
* Requirements - Details the functional and non-functional requirements of the system.
* Verification - The verification process ensures that the software system meets the specified requirements outlined in this document.
* Appendices - Contains supporting information and a glossary of terms used in the document.

This structure aims to facilitate a comprehensive understanding of the system, ensuring that all stakeholders are aligned on the project objectives and requirements.

## 2. Product Overview

### 2.1 Product Perspective
Describe the context and origin of the product being specified in this SRS. For example, state whether this product is a follow-on member of a product family, a replacement for certain existing systems, or a new, self-contained product. If the SRS defines a component of a larger system, relate the requirements of the larger system to the functionality of this software and identify interfaces between the two. A simple diagram that shows the major components of the overall system, subsystem interconnections, and external interfaces can be helpful.

### 2.2 Product Functions
Summarize the major functions the product must perform or must let the user perform. Details will be provided in Section 3, so only a high level summary (such as a bullet list) is needed here. Organize the functions to make them understandable to any reader of the SRS. A picture of the major groups of related requirements and how they relate, such as a top level data flow diagram or object class diagram, is often effective.

### 2.3 Product Constraints
This subsection should provide a general description of any other items that will limit the developer’s options. These may include:

* Interfaces to users, other applications or hardware.
* Quality of service constraints.
* Standards compliance.
* Constraints around design or implementation.

### 2.4 User Characteristics
Identify the various user classes that you anticipate will use this product. User classes may be differentiated based on frequency of use, subset of product functions used, technical expertise, security or privilege levels, educational level, or experience. Describe the pertinent characteristics of each user class. Certain requirements may pertain only to certain user classes. Distinguish the most important user classes for this product from those who are less important to satisfy.

### 2.5 Assumptions and Dependencies
List any assumed factors (as opposed to known facts) that could affect the requirements stated in the SRS. These could include third-party or commercial components that you plan to use, issues around the development or operating environment, or constraints. The project could be affected if these assumptions are incorrect, are not shared, or change. Also identify any dependencies the project has on external factors, such as software components that you intend to reuse from another project, unless they are already documented elsewhere (for example, in the vision and scope document or the project plan).

### 2.6 Apportioning of Requirements
Apportion the software requirements to software elements. For requirements that will require implementation over multiple software elements, or when allocation to a software element is initially undefined, this should be so stated. A cross reference table by function and software element should be used to summarize the apportioning.

Identify requirements that may be delayed until future versions of the system (e.g., blocks and/or increments).

## 3. Requirements

* Be uniquely identifiable.
* State the subject of the requirement (e.g., system, software, etc.) and what shall be done.
* Optionally state the conditions and constraints, if any.
* Describe every input (stimulus) into the software system, every output (response) from the software system, and all functions performed by the software system in response to an input or in support of an output.
* Be verifiable (e.g., the requirement realization can be proven to the customer's satisfaction)
* Conform to agreed upon syntax, keywords, and terms.

### 3.1 Actors

An actor is anything that exchanges data with the system. An actor can be a user, external hardware, or another system. The following are identified actors on the system.

#### 3.1.1 User

The User is the customer of the shop and he is searching products, selecting them and making an order. Also the user check the order status and track it's delivery.

#### 3.1.2 Admin

The Administrator has full access to the application. His role is to manage the products database, handle user orders, resolve any conflicts/issues the user might have and manage couriers.

#### 3.1.3 Courier

The Courier is responsible for order delivery. He is responsible for monitoring his application for new order norifications, accepts the orders and deliver them.


### 3.2 Functional

The following table summarizes the functional requirements for the ProjectSO shop web application.

| Req. No.     | Title               | Description                                 |
| ------------ | ------------------- | ------------------------------------------- |
| PrSO-FR1     | **Product list**    |                                             |
| PrSO-FR1.1   | List products       | Retrive products from the database and return them to the user |
| PrSO-FR1.2   | Search products     | Search products by a text query             |
| PrSO-FR1.3   | Filter products     | Filter products by criteria (category, price range, color, etc.) |
|              |                     |                                             |
| PrSO-FR2     | **Cart**            |                                             |
| PrSO-FR2.1   | Cart                | Implemen basic cart functionality: add/delete item, change item amount, calculate final price |
| PrSO-FR2.2   | Preserve cart contents | Store cart items between web sessions. Preserve cart contents after user closes browser tab |
|              |                     |                                             |
| PrSO-FR3     | **User account**    |                                             |
| PrSO-FR3.1   | Login               | Authenticate user through his email+password combination |
| PrSO-FR3.2   | Forgot password     | Make it possible for the user to change his password when he forgot it |
| PrSO-FR3.3   | Register account    | Allow the user to create an account using his email as identification method |
| PrSO-FR3.4   | Email verification  | Verify email validity. The system needs to make sure that the email is real and the user is able to receive emails from the system |
| PrSO-FR3.6   | Modify personal data | Allow the user to modify his personal data (phone number, email, First/Last name, date of birth, etc.) |
| PrSO-FR3.7   | Change password     | Allow the user to change his password       |
| PrSO-FR3.8   | Delete account and data | Delete account and any personal data that is linked to this account |
|              |                     |                                             |
| PrSO-FR4     | **Order** |                                                       |
| PrSO-FR4.1   | Create order        | Create order based on the cart's content and pass it to the manager/admin for further processing |
| PrSO-FR4.2   | Cancel order        | Allow the user to cancel his order          |
| PrSO-FR4.3   | Show orders         | List in-progress and completed orders       |
| PrSO-FR4.4   | Tracking            | Display tracking information of the order. Show it's current location and show destication point |
|              |                     |                                             |
| PrSO-FR5     | **Product management** |                                          |
| PrSO-FR5.1   | Manage products     | Create/update/delete products, assign category, change the amount in stock |
| PrSO-FR5.2   | Manage categories   | Create/update/delete product categories     |
|              |                     |                                             |
| PrSO-FR6     | **Order management** |                                            |
| PrSO-FR6.1   | Handle user order   | Accept/decline order, change its progress   |
|              |                     |                                             |
| PrSO-FR7     | **Courier management** |                                          |
| PrSO-FR7.1   | Manage couriers     | Create/delete couriers                      |
| PrSO-FR7.1   | Courier arbitration | The system should analyze the current active couriers and evenly distribute load between them |

The following table summarizes the functional requirements for the ProjectSO courier mobile application.

| Req. No.       | Title               | Description                                 |
| -------------- | ------------------- | ------------------------------------------- |
| PrSO-C-FR1     | **User account**    |                                             |
| PrSO-C-FR1.1   | Login               | Authenticate courier through his email+password combination |
| PrSO-C-FR1.2   | Forgot password     | Make it possible for the courier to change his password when he forgot it |
| PrSO-C-FR1.3   | Receive delivery request | The courier should receive delivery task with details about pick-up point and delivery address |
| PrSO-C-FR1.4   | Track courier location | The system should actively collect the couriers location and store it in the system in order to report the status to the user  |

### 3.3 Quality of Service

#### 3.3.1 Performance
If there are performance requirements for the product under various circumstances, state them here and explain their rationale, to help the developers understand the intent and make suitable design choices. Specify the timing relationships for real time systems. Make such requirements as specific as possible. You may need to state performance requirements for individual functional requirements or features.

#### 3.3.2 Security
Specify any requirements regarding security or privacy issues surrounding use of the product or protection of the data used or created by the product. Define any user identity authentication requirements. Refer to any external policies or regulations containing security issues that affect the product. Define any security or privacy certifications that must be satisfied.

#### 3.3.3 Reliability
Specify the factors required to establish the required reliability of the software system at time of delivery.

#### 3.3.4 Availability
Specify the factors required to guarantee a defined availability level for the entire system such as checkpoint, recovery, and restart.

### 3.4 Compliance
Specify the requirements derived from existing standards or regulations, including:
* Report format
* Data naming
* Accounting procedures
* Audit tracing

For example, this could specify the requirement for software to trace processing activity. Such traces are needed for some applications to meet minimum regulatory or financial standards. An audit trace requirement may, for example, state that all changes to a payroll database shall be recorded in a trace file with before and after values.

### 3.5 Design and Implementation

#### 3.5.1 Installation
Constraints to ensure that the software-to-be will run smoothly on the target implementation platform.

#### 3.5.2 Distribution
Constraints on software components to fit the geographically distributed structure of the host organization, the distribution of data to be processed, or the distribution of devices to be controlled.

#### 3.5.3 Maintainability
Specify attributes of software that relate to the ease of maintenance of the software itself. These may include requirements for certain modularity, interfaces, or complexity limitation. Requirements should not be placed here just because they are thought to be good design practices.

#### 3.5.4 Reusability


#### 3.5.5 Portability
Specify attributes of software that relate to the ease of porting the software to other host machines and/or operating systems.

#### 3.5.6 Cost
Specify monetary cost of the software product.

#### 3.5.7 Deadline
Specify schedule for delivery of the software product.

#### 3.5.8 Proof of Concept

### 3.6 Non-functional requirements

#### 3.6.1 System requirements

System requirements for the shop application:

| Req. No.     | Title               | Description                                 |
| ------------ | ------------------- | ------------------------------------------- |
| PrSO-SYS1    | Web based           | The shop application should be web based    |
| PrSO-SYS2    | Browser support     |                                             |
| PrSO-SYS2.1  | IE Edge             | IE Edge v16 or later                        |
| PrSO-SYS2.2  | Firefox             | Firefox v52 or later                        |
| PrSO-SYS2.3  | Chrome              | Chrome v57 or later                         |
| PrSO-SYS2.4  | Safari              | Safari v11 or later                         |
| PrSO-SYS2.5  | Opera               | Opera v44 or later                          |

System requirements for the courier application:

| Req. No.     | Title               | Description                                 |
| ------------ | ------------------- | ------------------------------------------- |
| PrSO-SYS3    | Phone app           | The courier application should be a phone app |
| PrSO-SYS4    | Phone OS support    |                                             |
| PrSO-SYS4.1  | Android             | Android 12 and higher (API level 31)        |
| PrSO-SYS4.2  | iPhone              | iOS 15.0 or later.                          |

#### 3.6.2 Security requirements

The following user security levels are required:

| Req. No.     | Title               | Description                                 |
| ------------ | ------------------- | ------------------------------------------- |
| PrSO-SEC1    | User                | View product list; search/filter products; add products to cart; modify cart; make a purchase; monitor order status and tracking; |
| PrSO-SEC2    | Admin               | View product list; modify product information and mount; accept/decline orders; manage couriers; |
| PrSO-SEC2    | Courier             | Receive delivery tasks; complete delivery;  |

## 4. Verification



## 5. Appendixes
