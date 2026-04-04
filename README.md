# 📦 Java WAR Build & Deployment Pipeline

This project demonstrates a complete CI/CD pipeline for a Java-based application that generates a **WAR (Web Application Archive)** artifact. The pipeline covers compilation, testing, code quality analysis, security scanning, packaging, and deployment to a repository.

---

## 🚀 Project Overview

The goal of this project is to automate the end-to-end build and deployment lifecycle of a Java web application using modern DevOps tools and best practices.

### 🔧 Pipeline Stages

1. **Compilation** – Compile the Java source code  
2. **Unit Testing** – Execute automated test cases  
3. **Code Analysis** – Perform static code analysis using SonarQube  
4. **Packaging** – Build the WAR artifact  
5. **Security Scanning** – Scan the artifact using Trivy  
6. **Deployment** – Upload the artifact to Nexus Repository  

---

## 🏗️ Tech Stack

- **Java** – Application development  
- **Maven / Gradle** – Build automation  
- **SonarQube** – Code quality analysis  
- **Trivy** – Security vulnerability scanning  
- **Nexus Repository** – Artifact storage  
- **CI/CD Tool** – Jenkins / GitHub Actions / GitLab CI (configurable)

---

## 📂 Project Structure
# buildproject
A manual Build Project with Tools Git, maven, sonarqube, trivy and nexus

project-root/
│
├── src/ # Application source code
├── pom.xml / build.gradle # Build configuration
├── sonar-project.properties # SonarQube configuration
├── Dockerfile (optional) # Containerization (if applicable)
├── .ci/ # CI/CD pipeline configs
└── README.md # Project documentation


---

## ⚙️ Prerequisites

Ensure the following tools are installed and configured:

- Java (JDK 8 or higher)
- Maven or Gradle
- SonarQube Server
- Trivy
- Nexus Repository Manager
- CI/CD tool (e.g., Jenkins)

---

## 🔄 Pipeline Workflow

### 1. Compile the Code

```bash
mvn clean compile


2. Run Unit Tests
mvn test
3. SonarQube Analysis
mvn sonar:sonar \
  -Dsonar.host.url=http://<sonarqube-server> \
  -Dsonar.login=<your-token>
4. Package the Application
mvn clean package

This generates a .war file in the target/ directory.

5. Scan with Trivy
trivy fs target/

Or scan the WAR file directly:

trivy fs target/<artifact-name>.war
6. Deploy to Nexus
mvn deploy

Ensure your settings.xml is configured with Nexus credentials.

🔐 Security & Quality Gates
SonarQube enforces:
Code coverage thresholds
Code smells and bugs detection
Trivy ensures:
No critical/high vulnerabilities before deployment
📊 CI/CD Integration Example (Jenkins Pipeline)
pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                sh 'mvn sonar:sonar'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Trivy Scan') {
            steps {
                sh 'trivy fs target/'
            }
        }
        stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}
📌 Best Practices
✅ Maintain high unit test coverage
✅ Fix all critical SonarQube issues before deployment
✅ Fail pipeline on security vulnerabilities
✅ Use versioned artifacts in Nexus
✅ Keep credentials secure (use secrets management)
🤝 Contributing
Fork the repository
Create a feature branch
Commit your changes
Submit a pull request
📞 Contact
Mobile: +91 7093371821
Email: projects2488@gmail.com
