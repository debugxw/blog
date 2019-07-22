package com.iblog.cacheservce.impl;

import com.iblog.cacheservce.UserCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.JedisPool;

@Repository("userCache")
public class UserCacheServiceImpl implements UserCacheService {

    @Autowired
    private JedisPool jedisPool;

    @Override
    public String get(String key) {
        return jedisPool.getResource().get(key);
    }

    @Override
    public String set(String key, String value) {
        return jedisPool.getResource().set(key, value);
    }

    @Override
    public String hget(String hkey, String key) {
        return jedisPool.getResource().hget(hkey, key);
    }

    @Override
    public long hset(String hkey, String key, String value) {
        return jedisPool.getResource().hset(hkey, key, value);
    }
}
