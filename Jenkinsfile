pipeline
{
    agent any
    stages
    {
        stage("checkout_Source_Code")
        {
            steps
            {
git branch: 'feature3', url: 'https://github.com/dataquaintacademy/buildproject.git'
            }
        }
        stage("build")
        {
            steps
            {
                sh 'mvn package'
            }
        }
        stage("deploy")
        {
            steps
            {
                sh 'sudo cp /var/lib/jenkins/workspace/declarative/target/ecommerce-platform-1.0.0-SNAPSHOT.war /var/lib/tomcat10/webapps/app.war'
            }
        }
    }
}
