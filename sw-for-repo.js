// Versión para repositorio NO principal (con nombre de repo)
const CACHE_NAME = 'mi-app-cache-v1';
const urlsToCache = [
    '/practica2pwa/',
    '/practica2pwa/index.html',
    '/practica2pwa/style.css',
    '/practica2pwa/manifest.json',
    '/practica2pwa/icons/web-app-manifest-192x192.png',
    '/practica2pwa/icons/web-app-manifest-512x512.png'
];

self.addEventListener('install', event => {
    console.log('[Service Worker] Installed');
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => {
            return cache.addAll(urlsToCache);
        })
    );
});

self.addEventListener('activate', event => {
    console.log('[Service Worker] Activated');
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.filter(name => name !== CACHE_NAME)
                    .map(name => caches.delete(name))
            );
        })
    );
});

self.addEventListener('fetch', event => {
    console.log('[Service Worker] Fetching:', event.request.url);
    event.respondWith(
        caches.match(event.request).then(response => {
            return response || fetch(event.request);
        })
    );
});
