'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "bc8f24d74d0e06f82e557b152e345574",
"splash/img/light-2x.png": "8d59e4e3389d45f29afc320a39f3f6db",
"splash/img/dark-4x.png": "d27105cccd01b51e38cde5be28c592e5",
"splash/img/light-3x.png": "505c3038c8fb53b8502803cba8801859",
"splash/img/dark-3x.png": "505c3038c8fb53b8502803cba8801859",
"splash/img/light-4x.png": "d27105cccd01b51e38cde5be28c592e5",
"splash/img/dark-2x.png": "8d59e4e3389d45f29afc320a39f3f6db",
"splash/img/dark-1x.png": "cdd00700d283547abc15edb575e0db25",
"splash/img/light-1x.png": "cdd00700d283547abc15edb575e0db25",
"index.html": "a9d32f7791a31aa63f43663d463f5fd6",
"/": "a9d32f7791a31aa63f43663d463f5fd6",
"main.dart.js": "1058cf96a2e157df9bb054ab59436363",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "58197bc31f88b09f5630c92850f022ee",
"icons/Icon-192.png": "955abcba0c180310c24aa5e55120253d",
"icons/Icon-maskable-192.png": "955abcba0c180310c24aa5e55120253d",
"icons/Icon-maskable-512.png": "8d59e4e3389d45f29afc320a39f3f6db",
"icons/Icon-512.png": "8d59e4e3389d45f29afc320a39f3f6db",
"manifest.json": "2d098b81210d017c9a3ca6a9cdd4e0df",
"assets/AssetManifest.json": "c2f6d947c4113b7b4c842395d9cb4faf",
"assets/NOTICES": "04b113cb52cf1a0d0200ad6a640f1692",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "6d0a5a451a1a241c2138377b16a90c12",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "770d5669d88c4b94b6763365aded2209",
"assets/fonts/MaterialIcons-Regular.otf": "2d58083008cb1b95cffb3e7069c2fd14",
"assets/assets/images/explain.png": "ac9308de3966bded36276e6af3e02605",
"assets/assets/images/mage.png": "cf6a8fc9bbd97a31e7d0fe7de1ad5c3b",
"assets/assets/images/community.png": "302d70eea06dcae0a264f2c1ec2487c2",
"assets/assets/images/translate.png": "c0e69ef8becef84a63dc7f17960dfa43",
"assets/assets/images/NJ_GetUp_2.jpeg": "68cf76a7fdd2b4caaf15ff43c73ce934",
"assets/assets/images/edit.png": "6439b8aa8351e58fd3edfa853e35b6d4",
"assets/assets/images/categories/8.png": "03a9a023cea4d5a28f301767cd631b42",
"assets/assets/images/categories/9.png": "7404e33c2ac22cf636406d8cc0561baf",
"assets/assets/images/categories/14.png": "2c399f56c741a672e0d1c3f2165c463f",
"assets/assets/images/categories/15.png": "4a31cc7b1ec6ba49a2d7af671daa1513",
"assets/assets/images/categories/16.png": "03a9a023cea4d5a28f301767cd631b42",
"assets/assets/images/categories/12.png": "4a31cc7b1ec6ba49a2d7af671daa1513",
"assets/assets/images/categories/13.png": "7404e33c2ac22cf636406d8cc0561baf",
"assets/assets/images/categories/11.png": "03a9a023cea4d5a28f301767cd631b42",
"assets/assets/images/categories/10.png": "2c399f56c741a672e0d1c3f2165c463f",
"assets/assets/images/categories/4.png": "4a31cc7b1ec6ba49a2d7af671daa1513",
"assets/assets/images/categories/5.png": "7404e33c2ac22cf636406d8cc0561baf",
"assets/assets/images/categories/7.png": "4a31cc7b1ec6ba49a2d7af671daa1513",
"assets/assets/images/categories/6.png": "2c399f56c741a672e0d1c3f2165c463f",
"assets/assets/images/categories/2.png": "2c399f56c741a672e0d1c3f2165c463f",
"assets/assets/images/categories/3.png": "03a9a023cea4d5a28f301767cd631b42",
"assets/assets/images/categories/1.png": "7404e33c2ac22cf636406d8cc0561baf",
"assets/assets/images/send.png": "c53fa4cf126b3343ab8baa9394041dcb",
"assets/assets/icons/jumunseo_logo.png": "5cd408319def56c5e3db155d6c727744",
"assets/assets/icons/logo.png": "5cd408319def56c5e3db155d6c727744",
"assets/assets/icons/profile.png": "242f98889c7d3293c16c0ba7dadc8b32",
"assets/assets/icons/setting.png": "ab41a3af948024a538aa0ae2406a33c3",
"assets/assets/animations/punch_lottie.json": "b1ec9a87a39d8d7127094a213ac24ff3",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
