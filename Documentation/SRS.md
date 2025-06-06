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
  * 3.7 [Use Case Diagrams](#37-use-case-diagrams)
    * 3.7.1 [User Auth Diagram](#371-user-auth-diagram)
    * 3.7.2 [User Activity Diagram](#372-user-activity-diagram)
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
The Internet Shop system specified in this SRS is a new, self-contained product designed to provide an enhanced online shopping experience. It is not part of an existing product family, but rather a stand-alone solution aimed at integrating modern e-commerce functionalities with robust order tracking capabilities.

The product consists of two main components:

* Web Application: The online storefront where customers can browse products, place orders, and manage their accounts. It includes features such as a product catalog, shopping cart, and live order tracking via an integrated map.
* Desktop and Tablet application for Delivery purpose. Fast Update, data sync and offline access to usefull data in essential for that job.

The Internet Shop system integrates with Salesforce through an API, allowing seamless data flow between the web application, desktop application, and Salesforce CRM. This integration ensures that customer data, order details, and inventory updates are consistent across all platforms. Additionally, the system connects to a Map API to enable real-time order tracking for users.

![Architecture](https://github.com/user-attachments/assets/f5de323e-0b7e-4065-b064-f6d4166739ba)


### 2.2 Product Functions

The Internet Shop system is designed to deliver a smooth and efficient online shopping experience, along with backend tools for managing orders, inventory, and customer interactions. The major functions of the system are:

#### Product Catalog Management:

* Display product listings with detailed descriptions, images, and prices.
* Support search, filtering, and sorting for easy product discovery.

#### User Account Management:

* Allow users to create and manage their accounts, view order history, and save payment methods.
* Provide secure authentication and profile management features.

#### Shopping Cart and Checkout:

* Enable users to add, remove, and modify items in their shopping cart.
* Facilitate a streamlined checkout process, including payment and order confirmation.

#### Order Tracking:

* Provide real-time order tracking, showing the current location of deliveries on a live map.
* Notify users of updates regarding their orders’ status.

#### Salesforce Integration:

* Sync customer data, orders, and inventory between the web application, desktop application, and Salesforce CRM.
* Automate the process of order updates and inventory adjustments.

#### Administrative Functions (Desktop Application):

* Manage inventory, including adding new products, updating stock levels, and handling promotions.
* Access customer information, process returns, and manage support requests.

#### Analytics and Reporting:

* Generate reports on sales, customer behavior, and inventory levels.
* Provide insights into operational performance to aid business decision-making.

### 2.3 Product Constraints

#### 1. Interfaces
User Interface:

* The web application must be responsive and compatible with modern web browsers (Chrome, Firefox).
* The desktop and tablet application must function seamlessly across Windows, Android operating systems.

External Integration:

* The system must integrate with Salesforce via its API to ensure real-time data synchronization.
* Real-time order tracking must utilize a Map API, requiring compliance with the specific API standards and usage limits.

#### 2. Quality of Service Constraints
Performance:
* The system must handle up to 100 concurrent users without performance degradation.
* Response times for key operations (loading the product catalog, placing orders) must not exceed 5 seconds.

Availability:

* The system should have an uptime of at least 99.5%, ensuring reliability and continuous service.

Security:

* All customer data must be securely stored and comply with data protection regulations.
* The system should use secure authentication mechanisms to protect user accounts.

#### 3. Standards Compliance

Development Standards:

* The system must adhere to coding standards and best practices (SOLID principles for OOP).

Web Standards:

* The web application must follow W3C guidelines for accessibility to ensure usability for all users, including those with disabilities.

#### 4. Design and Implementation Constraints

Platform Dependency:

* The web application must be developed using LWR Framework for ease of integration and maintenance for Salesforce web applications.
* The desktop application should be built using .NET to ensure compatibility across target platforms.

Scalability:

* The system must be designed to support future expansions, such as adding new features or handling larger volumes of transactions.

Third-Party Services:

* Dependency on external services (e.g., payment gateways, map providers) must be managed carefully to ensure seamless integration and minimal disruptions.

### 2.4 User Characteristics

1. Customers

* Description: End-users who browse the product catalog, make purchases, and track orders.
* Characteristics:
   * Varying levels of technical expertise, from beginners to experienced online shoppers.
   * Require a user-friendly, intuitive interface for easy navigation and checkout.
   * Access to core features such as product search, shopping cart, order tracking, and account management.

* Frequency of Use: Occasional to frequent, depending on their shopping habits.
* Importance: High - ensuring a smooth and satisfying user experience for customers is critical to the system’s success.

2. Courier

* Description: Internal users responsible for order delivery.
* Characteristics:

 * Familiar with the product order queue managment.
 * Need tools for handling order status update.

* Frequency of Use: Occasional to frequent, depending on order queue load.
* Importance: High - delivery is one of the key performance metrics for the product.

3. System Administrator

* Description: Technical users who manage system configurations, handle integration, and maintain system security.
* Characteristics:
** High level of technical expertise, including knowledge of APIs, database management, and security protocols.
** Responsible for ensuring system availability, troubleshooting issues, and maintaining integrations (e.g., Salesforce, Map API).
** Manage user roles and permissions to ensure appropriate access levels.
* Frequency of Use: As needed, typically more frequent during setup and maintenance periods.
* Importance: Medium - essential for system upkeep and smooth operation.


### 2.5 Assumptions and Dependencies


1. Assumptions

* User Accessibility:

** It is assumed that customers have stable internet connections to access the web application without issues.
** Customers will use modern web browsers that support the latest web standards (e.g., HTML5, CSS3, JavaScript ES6+).

* System Integration:

** The Salesforce CRM and desktop application APIs will be available and reliable, ensuring seamless data synchronization.
** The Map API service will remain accessible and will support real-time tracking functionalities as required.

* Scalability:

* The system is expected to handle the anticipated load of users and transactions. Any significant increase beyond projections will require additional resources and potential system scaling.
* It is assumed that the server infrastructure will support the required performance benchmarks for handling concurrent users.

* Data Security:

** The system will comply with relevant data protection laws (e.g., GDPR, CCPA), and no significant changes in these regulations will necessitate major adjustments to the software.

* Development Environment:

** Developers will have access to the necessary tools, frameworks, and technologies to build and maintain the system.
** The project timeline assumes no major disruptions to the development process (e.g., changes in team structure, delays in acquiring resources).

2. Dependencies

* Third-Party Services:

** The system depends on external services, such as payment gateways and the Map API, for certain functionalities. ** Availability, pricing, and performance of these services may impact the project.
** Integration with Salesforce relies on the stability and backward compatibility of the Salesforce API.

* Software Components:

** The web application depends on certain open-source libraries and frameworks (e.g., React, Node.js) that must remain stable and supported. Any major changes in these components could require updates to the system.
** The desktop application depends on frameworks like Electron or .NET, and updates to these platforms may necessitate maintenance or code adjustments.

* Infrastructure:

** The system relies on cloud-based hosting services (e.g., AWS, Azure) to ensure high availability, security, and scalability. Any issues with these services could directly affect system performance.
** Backup and disaster recovery systems are assumed to be in place and operational, ensuring minimal data loss and quick recovery in case of incidents.

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
| PrSO-FR7.2   | Courier arbitration | The system should analyze the current active couriers and evenly distribute load between them |

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

### 3.7 Use Case Diagrams

#### 3.7.1 User Auth Diagram

![Activity_UserState](https://github.com/user-attachments/assets/b3e0280e-f665-4f78-87e3-b4da04921f27)

#### 3.7.2 User Activity Diagram

![Activity_Actors](https://github.com/user-attachments/assets/4ca16183-b2c0-45d3-b039-af71dff4e90e)

## 4. Verification

## 5. Appendixes
