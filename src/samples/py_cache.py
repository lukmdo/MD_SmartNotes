def get_from_cache(key, expire_time=60 * 60):
    data = memcache.get(key)
    if data is not None:
        return data
    else:
        data = some_time_consuming_calculations()
        memcache.add(key, data, expire_time)
        return data
