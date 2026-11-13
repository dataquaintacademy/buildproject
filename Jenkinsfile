pipeline
{
    agent any
    tools
    {
        maven 'maven363'
    }
    stages
    {
          
        stage("checkout_source_code")
        {
            steps
            {
             git branch: 'main', url: 'https://github.com/dataquaintacademy/buildproject.git'
            }
        }
        stage("compile_source_code")
        {
            steps
            {
                sh 'mvn package'
            }
        }
        stage("run_unit_tests")
        {
            steps
            {
                sh 'mvn test'
            }
        }
        stage("code_analysis_and_reporting")
        {
            steps
            {
                script{
                      def scannerHome = tool 'sonar-scanner'
                                 withSonarQubeEnv(
            installationName: 'sonarserver',
            credentialsId: 'sonar-token'
        ) {
            sh """
                    ${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=devops-flow \
                    -Dsonar.projectName=DevOps-Flow \
                    -Dsonar.sources=. \
                    -Dsonar.java.binaries=target/classes
                """
        }
                }
            }
        }
        stage("QualityGate")
        {
            steps
            {
                  timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
        }
        stage("trivy_scan_filesystem")
        {
            steps
            {
sh '''      trivy fs . \\
  --scanners vuln,misconfig,secret \\
  --severity HIGH,CRITICAL \\
  --exit-code 1 \\
  --format table'''
            }
        }
        stage("Build_the_artifact")
        {
            steps
            {
                sh 'mvn clean package'
            }
        }
        
        
                stage("Scan_the_artifact")
        {
            steps
            {
sh '''trivy fs ./target/*.war \\
  --scanners vuln \\
  --severity HIGH,CRITICAL \\
  --exit-code 1 \\
  --format table'''
            }
        }
     
        stage('Deploy to Nexus') {
    steps {
        configFileProvider([
            configFile(
                fileId: 'mavensettings',
                variable: 'MAVEN_SETTINGS'
            )
        ]) {
            sh '''
                mvn -s "$MAVEN_SETTINGS" clean deploy
            '''
        }
    }
}

stage('Deploy_to_QA_Tomcat') {
    steps {
        deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcatqacreds', path: '', url: 'http://172.31.2.135:7070')], contextPath: 'testapp', war: '**/*.war'
        }
    }
stage('Smoke_Test') {
    steps {
        sh 'sleep 15 && curl -f http://3.107.68.172:7070/testapp/'
    }
}
stage('Approval') {
    steps {
        timeout(time: 30, unit: 'MINUTES') {
            input message: 'Deploy to Production?', ok: 'Deploy'
        }
    }
}
stage("Deploy_to_prod")
{
    steps
    {
        withCredentials([usernamePassword(credentialsId: 'tomcat-creds', usernameVariable: 'TC_USER', passwordVariable: 'TC_PASS'), usernamePassword(credentialsId: 'nexus-creds', usernameVariable: "NX_USER", passwordVariable: 'NX_PASS')])
        {
            sh '''
            curl -f -u $NX_USER:$NX_PASS -o app.war "http://172.31.17.101:8081/repository/maven-releases/com/ecommerce/ecom/1.0.1/ecom-1.0.1.war"
            curl -f -u $TC_USER:$TC_PASS -T app.war "http://172.31.2.135:7070/manager/text/deploy?path=/myapp&update=true"
            '''
        }
    }
}

        
    }
}
