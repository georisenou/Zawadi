const staticDevCoffee = "zawadi-vendeur-v1"
const assets = [
  "/offline/",
  "/static/off.svg",
  "/static/logo_client.png",
  "/static/logo.png",
  "/static/src/output.css",
  "/static/vue.global.prod.js"
]

self.addEventListener("install", installEvent => {
  installEvent.waitUntil(
    caches.open(staticDevCoffee).then(cache => {
      cache.addAll(assets)
    })
  )
})

// Serve from Cache
self.addEventListener("fetch", event => {
  event.respondWith(
      caches.match(event.request)
          .then(response => {
              return response || fetch(event.request);
          })
          .catch(() => {
              return caches.match('/offline/');
          })
  )
});

// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here. Other Firebase libraries
// are not available in the service worker.
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');
// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
firebase.initializeApp({
  apiKey: "AIzaSyC5tw6eOAoi0vKT3hiyIAPND8ovAFp91Xs",
  authDomain: "zawadi-fe511.firebaseapp.com",
  projectId: "zawadi-fe511",
  storageBucket: "zawadi-fe511.appspot.com",
  messagingSenderId: "740387796760",
  appId: "1:740387796760:web:aec758d6918ce20098d06d",
  measurementId: "G-8X3HR2FPHK"
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging();