dataSource {
    driverClassName = "com.mysql.jdbc.Driver"
    minIdle = 1
    numTestsPerEvictionRun = 3
    testOnBorrow = true
    testWhileIdle = true
    testOnReturn = true
    validationQuery = "SELECT 1"
    minEvictableIdleTimeMillis = (1000 * 60 * 5)
    timeBetweenEvictionRunsMillis = (1000 * 60 * 5)
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            username = 'root'
            password = 'igdefault'
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/sc?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
