pipeline {
  agent any 
  stages {
    stage('Checkout') {
      steps {
        println 'Se clona repositorio en espacio de trabajo'
        checkout scm
      }
    }
    stage('Build') {
      steps {
        println 'Se realiza build'
        sh "chmod 777 gradlew"
        sh "./gradlew build"
      }
    }
    stage('Code Review') {
      steps {
        println 'Se ejecuta análisis con SonarCloud'
        sh "set +x; ./gradlew sonarqube -Dsonar.login=be23d9995a099b614e87eedc5924ca7f4a0f0b57 -Dsonar.branch.name=feature-nicolasAravena-interfaz"
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker build -t spring-clinic .'
        sh 'docker run spring-clinic'
      }
    }
  }
}

