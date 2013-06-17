## ROADMAP

#### 0.7.1
 Original fork from https://github.com/bensomers/improved-rack-throttle

#### 0.8.0 +
 The main problem with this middleware is that it doesnt scale well. Especially with redis. The keys are stored in the cache and they increase indefinitely (unless you're using an LRU mechanism).
 This is a nightmare for scalability. So the main feature added will be the concept of an expiring key. Using redis's built in expiry mechanism will speed this up considerably.
 Initial addition of an expiry mechanism. Only redis will be supported initially.
 Memcache and GDBM support later.

#### 0.9.0 +
 Anyones guess

