'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "1a085b906584b1c1aaa740da32c5da2e",
".git/config": "b943e33fdf8e5c192c3387eafbc599f1",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "78aed599e3eaa2a690ae1e401ccf2050",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ecc03e1b8f33453bdb92fe9df86452d9",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "35b801fc2056feb518d1acd976f162e5",
".git/logs/refs/heads/main": "35b801fc2056feb518d1acd976f162e5",
".git/logs/refs/remotes/origin/HEAD": "c0cfd54225c5728cedec9166b0af08eb",
".git/logs/refs/remotes/origin/main": "2e8065957e4c5e2858ad58e702c03ac9",
".git/objects/1f/64e3ebc5bec34f1c1fe6857beb53a6cb1df7ae": "e7fa52d920dd05cd32f1329218445116",
".git/objects/22/c4999406d4b2129d1e7837a420eba7c04cfa68": "7fa4900ec454c962e7168e6e94d4df87",
".git/objects/23/04c05e099b625ee83f2fd792b363d002611cb6": "4edc42ba6ff47fba239837cf73698478",
".git/objects/33/b327b8a5e87ed6b4fdd7d23cc18d98ddb2fa2b": "3457cc7050cab724c7723fb0d16a12f3",
".git/objects/6c/7c01c0c7b45216ef5c3fc8c8ee7931f6728fe8": "42dd75c85b5d0b47cc7f3d4e5459a391",
".git/objects/86/8b6fbbc7d2e5a915d48aa6da9cae13c9d2217b": "d8149ff798c64ec5a65227ef5ff2bcb6",
".git/objects/b3/b5f627d1c064abcb8189b5dec27b49fa42f588": "752644c06a9fb1c44ae2fca88862710d",
".git/objects/b6/075f4257cd319aa4529483db8ba0fdf06ed064": "cfbc13e47205c16f3e62f88b216ab42d",
".git/objects/b9/6ac1f49dcb922dc964307bd764c3b927d6ab51": "ad9b73608046593012b991fcfc017421",
".git/objects/e6/d404b551e77a292ae77a30d48a7fa7f4dbafb4": "06ff268b858f2630a27cb580f7c93442",
".git/objects/fb/68434644592f518af5464ec128c970b49c0c86": "1015a27bce290ddac7900c0d2b76ad64",
".git/objects/pack/pack-baf6efa320cf25ac6993fad98e5be6624096f75b.idx": "e021443a21df5cfa48c6de32d75fb5a2",
".git/objects/pack/pack-baf6efa320cf25ac6993fad98e5be6624096f75b.pack": "2838f0182f6937200549dc45165fa7d9",
".git/packed-refs": "2cc8f90fad575e327820964116887796",
".git/refs/heads/main": "2344a4a2c4c3d1e8bf8e7ae9d8388398",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "2344a4a2c4c3d1e8bf8e7ae9d8388398",
"assets/AssetManifest.json": "3aec7a09e9a89238a38779c92781fcd9",
"assets/assets/fonts/OpenSans-Regular.ttf": "dd7ca4f5cf9c67d1d028da5c01d67884",
"assets/assets/images/7.jpg": "1b3ce4ae8060f91af5d34dc575199056",
"assets/assets/images/skanic.png": "58d80f6d509b7be7441bdd46246052c5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "3eb97415753bc6b3f3d8bf98e805bd76",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"canvaskit/canvaskit.js": "bc4a0f2406aeadaf560b641c5617c18a",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "e275cb040a1d217b0f8f54b8fbd2ef52",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"CNAME": "9d5356e337ead026b9be566f8c34266c",
"flutter.js": "f916451a1f92b11ff8e28c4f8286d327",
"icons/apple-touch-icon.png": "53556f569498b4cf056609c1f7c0da3a",
"icons/favicon.ico": "fb5f3713968819a20409060d6f9938af",
"icons/icon-192-maskable.png": "f97f2ba839fca53ac922b4ea3abbb076",
"icons/icon-192.png": "df120e6eebcca912e6446af2e607909b",
"icons/icon-512-maskable.png": "b0b7c511dcbe2f02027e8f0572682815",
"icons/icon-512.png": "0785c54e8e1658b950bb3858ad6d2801",
"index.html": "959fa1dab4eba96474cced7b2af1a41d",
"/": "959fa1dab4eba96474cced7b2af1a41d",
"LICENSE": "0124fedd0ebc837dcded4916328fa822",
"main.dart.js": "2aa8b19805c35036b337ac0c24ae538f",
"manifest.json": "0f54e2f58df53679cb15f597b4e39de1",
"version.json": "a5df9f969d922c7497a4d956ff68c264"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
