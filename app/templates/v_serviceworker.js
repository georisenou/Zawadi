const staticDevCoffee = "zawadi-vendeur-v1"
const assets = [
  "/offline/",
  "/static/off.svg",
  "/static/logo_client.png",
  "/static/logo.png"
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