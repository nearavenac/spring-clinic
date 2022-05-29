node {
  env.SONAR_TOKEN = 'be23d9995a099b614e87eedc5924ca7f4a0f0b57' 

  stage('Checkout'){
    println 'Se clona repositorio en espacio de trabajo'
    checkout scm
  }

  stage('Build'){
    println 'Se realiza build'
    sh "chmod 777 gradlew"
    sh "./gradlew build"
  }
  
  stage('Code Review'){
    println 'Se ejecuta análisis con SonarCloud'
    sh "set +x; ./gradlew sonarqube -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=feature-nicolasAravena-interfaz"
  }
}
