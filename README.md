# Construction-Data-Management-System
This is a SQL case study exploring the construction industry:  I started by generating the initial business idea, then went on to set up the database structure and fill it with contractor, project, and client information. During this process, I also developed a revenue model for the project.  Using SQL, I conducted analysis on the data.

#About Database

Entities:
Contractor: Companies or individuals responsible for carrying out construction projects.
Client: Entities that contract the services of contractors for construction projects.
Counselor: Advisors or consultants who may assist clients or contractors with their projects or subscriptions.
Project: Construction projects undertaken by contractors for clients.
Project Phase: Different stages of a construction project, such as planning, construction, and finishing.
Subscription: Service agreements between clients or contractors and the platform, offering various subscription types.
Products: Displays the Products offered by the clients.

Relationships:
Contractors undertake multiple projects, establishing a one-to-many relationship between contractors and projects.
Each project can have multiple phases, forming a one-to-many relationship between projects and project phases.
Clients can subscribe to various subscription types, forming a one-to-many relationship between clients and subscriptions.
Counselors can be associated with multiple subscriptions, establishing a one-to-many relationship between counselors and subscriptions.
Contractors and clients can have subscriptions, forming one-to-many relationships between contractors and subscriptions and between clients and subscriptions.
There's a one-to-many relationship between clients and products, indicating that a client can offer multiple products.

Subscriptions:
Subscription types include "Basic" and "Premium," each offering different services and features.
Subscriptions may have start and end dates, along with associated amounts representing subscription fees.
Clients and contractors can subscribe to different subscription types, providing access to platform services(counselors) and features tailored to their needs.

