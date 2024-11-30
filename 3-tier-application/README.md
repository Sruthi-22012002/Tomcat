# 3-tier application
### Project Overview
Develop a 3 tier application and run in local machine. create a custom dockerfile for each tier.Create a volume and attach the database container.
## Features
* Add Employee list
* Show employee list
## 1. Installation 
### 1.1  Prerequisites
> 1. Java 17
> 2. Maven 3.8.8
> 3. NodeJs 14.x
> 4. MySQL 8.x
### 1.2 Setup Instructions
#### Step 1 : 
```bash
git clone https://github.com/username/project-name.git
cd project-name
```
#### Step 2 :
```bash
npm install
```
#### Step 3 :
> Environment setup
#### Step 4 :
```bash
npm start
```
## 2 . Architecture Overview
### Flow chart
#### Process flow
```mermaid
  flowchart TD
    Start([Start]) --> Decision{Add employee}
    Decision -->|Submit| Task1[stored in Database]
    Decision -->|Cancel| Task2[Back to home]
    Task1 --> End([End])
    Task2 --> End([End])
```
#### Work flow
```mermaid
flowchart TD
    User[User] -->|Submit form| Frontend[react-hooks-frontend]
    Frontend -->|Sends data to database| Backend[springboot-backend]
    Backend -->|Information Stored| Database[(Database)]
```
## 3 . Roadmap
### 3.1 Plan
* Project overview and plan
* Installation & Environment Setup
* Build app and deploy
* Testing
* Documentation
* Review
### 3.2 In Progress
* Installation & Environment setup
### 3.3 Completed
* project overview and plan

```mermaid
gantt
    title React App
    dateFormat  MM-DD-YYYY
    section Completed
    project overview   :done, 11-24-2024, 11-24-2024
    Installation       :done, 11-24-2024, 11-24-2024
    Environment setup     :done, 11-24-2024, 11-24-2024
    Build and deploy    : done, 11-25-2024, 11-26-2024
    section In Progress
   Create a docker file : active,11-26-2024, 11-27-2024
    section Planned
   
    Testing and Review  : 11-27-2024, 11-27-2024
```
## Reference
[Dockerhub](https://hub.docker.com/)
