importScripts('https://www.gstatic.com/firebasejs/12.15.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/12.15.0/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: 'AIzaSyAs4Mr0X2zhGvoLjNOtjpvp2MUV4ZpAspg',
  appId: '1:565657632479:web:099ad1a65b12a0d13e336a',
  messagingSenderId: '565657632479',
  projectId: 'chatthub-5d707',
  authDomain: 'chatthub-5d707.firebaseapp.com',
  storageBucket: 'chatthub-5d707.firebasestorage.app',
  measurementId: 'G-5RQVZ57N4M',
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log('Background message:', payload);
});