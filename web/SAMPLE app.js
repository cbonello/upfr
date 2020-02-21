const firebaseConfig = {
  apiKey: 'YourApiKey',
  authDomain: 'YourAuthDomain',
  databaseURL: 'YourDatabaseUrl',
  projectId: 'YourProjectId',
  storageBucket: 'YourStorageBucket',
  messagingSenderId: 'YourMessagingSenderId',
  appId: 'YourAppId',
  measurementId: 'YourMeasurementId'
}
firebase.initializeApp(firebaseConfig)
firebase.analytics()
