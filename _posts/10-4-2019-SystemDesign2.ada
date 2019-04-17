---
layout: post
title: "System Design Foundations - Part 2 - Databases"
date: 2019-04-10
excerpt: "Understanding databases for system design."
tags: [System Design, database]
comments: true
---
# Databases

It might be possible that as the number of concurrent requests increase the application gets slower and slower. One possible cause could be the database's inability to handle the increasing requests. 

Let us talk about relational databases first. Any relational database has a set of properties known as ACID
Atomicity - Each transaction is all or nothing
Consistency - Any transaction will bring the databse from one valid state to another.
Isolation - Executing transactions concurrently has the same results as if the tractions were executed serially
Durability - Once a transaction has been commited, it will remain so. 

In order to scale a database we can do one of the following.

# Replication

Replication is when the same data is stored in multiple storage devices.  In distributed system the DBMS works to ensure that changes to the data are automatically reflected in the data stored at all the storage locatiuons. The following replication strategies are commonly used in distributed systems. 

### Active-Active replicaiton - push
Here each request is processed by all the servers. This refers to a two way replication of data between two databases that are both being actively updated. It is also refered to as the multi-master replication.  

### Active-Passive replication - Pull
The active passive replication is a one way replication from a master databse that is being actively updated to a slave database. The slave databases are not updated except by the replication process. This is also refered to as the master-slave replication.

### Tree Replication
A master server is replicated to create several first generation replicas, which themselves are replicated to form second generation replicas and so on. 

### Buddy replication 
Each serverr chooses buddies and replicated only to those specific buddies. A servers buddies will have a backup of its data. All the buddies of a server are referred to as its buddy pool. 

# Database Mirroring 
In database mirroring, we create copies of a database in different server instances (principal and mirror). The difference between mirroring and replication is that in mirroring the copies work as standby copies and are not always active as is the case with database replication. 

Database mirroring operates on an entire database. This means that you cant query a mirrored database directly. The principal server instance provides the database to clients. The mirror server instance acts as a standby that can take over in case of a problem with the principal server instance. 

For maximum accuracy, the mirror server instance must alwys stay current and must store every change in the principal server's content. 

## Federation

Federation splits up databases by function. It means that several databases hold infomration, but certain instances are completly responsible for different portions of the data. That is, instead of a single, monolithic database, you could have three databases: forums, users and products, resulting in less read and write traffic to each database and therefore less replication lag. 

Pros:
1. Smaller databases result in more data that can fit in mmeory, which in turn results in more cache hits due to imporved cache locality.
2. With no single central master serializing writes you can write in parallel, increasing throughput. 

Cons:
1. Federation is not effective if your schema requires huge functions or tables. 
2. You will need to update your application logic to determine which database to read and write
3. Joining data from two databases is more complex with a server link.
4. Federations adds more hardware and additional complexity.


## Sharding


Sharding is a method where the data is distributed across smaller, faster databases such that each database can manage only a subset of the data. These smaller databases are called data shards. 

Pros: 
1. If one shard goes down, the other shards are still operational.
2. Like federation, there is no single central master serializing writes, allowing you to write in parallel with increased throughput. 
3. Sharding results in less read and write traffic, less replication, and more cache hits. 
4. Index size is reduced which improves performance with faster queries.

Cons:
1. The application logic must be updated to work with shards (might require complex SQL queries)
2. Rebalancing data when a shard outgrows the storage and needs to be split is complicated. A sharding function based on consistent hashing can reduce the amount of transfered data. 
4. Data distribution is difficult. A set of power users on a shard could result in increase load to that shard compared to others.
5. Joining data from multiple shards in more complex
6. Sharding adds more hardware and additional complexity. 

## Denormalization
This is a technique where we add redundant data to one more tables. It can help us avoid expensive joins in a relational database. This attempts to improve read performance at the expense of some write performance. In most systems, read heavily outnumbers writes. A read resulting in a complex database join can be very expensive, spending significant time on disk operations. 

Some RDBMS such as PostgreSQL and Oracle support materialized views which can handle the work of storing redundant information and keeping the redundant copies consistent. 

Once data becomes distributed with techniques such as fedaration and sharding, managing joins across data centers further increases complexity. Denormalization might circumvent the need for such complex joins.  

Pros:
1. Retriving data is faster since we do fewer joins
2. Is a useful technique when used in conjunction with fedaration and sharding

Cons:
1. Updates and inserts are more expensinve
2. A denormalized database under heavy write load mught perform worse than its normalized counterpart.
3. Data is duplicated (more disk space)
4. COnstraints can help redundant copies of information stay in sync, which increases complexity of the database design. 

## SQL Tuning
source: System design primer

SQL tuning is a broad topic and many books have been written as reference.

It's important to benchmark and profile to simulate and uncover bottlenecks.

1. Benchmark - Simulate high-load situations with tools such as ab.
2. Profile - Enable tools such as the slow query log to help track performance issues.

Benchmarking and profiling might point you to the following optimizations.

#### Tighten up the schema
1. MySQL dumps to disk in contiguous blocks for fast access.
2. Use CHAR instead of VARCHAR for fixed-length fields.
CHAR effectively allows for fast, random access, whereas with VARCHAR, you must find the end of a string before moving onto the next one.
3. Use TEXT for large blocks of text such as blog posts. TEXT also allows for boolean searches. Using a TEXT field results in storing a pointer on disk that is used to locate the text block.
4. Use INT for larger numbers up to 2^32 or 4 billion.
5. Use DECIMAL for currency to avoid floating point representation errors.
6. Avoid storing large BLOBS, store the location of where to get the object instead.
7. VARCHAR(255) is the largest number of characters that can be counted in an 8 bit number, often maximizing the use of a byte in some RDBMS.
8. Set the NOT NULL constraint where applicable to improve search performance.

#### Use good indices
1. Columns that you are querying (SELECT, GROUP BY, ORDER BY, JOIN) could be faster with indices.
2. Indices are usually represented as self-balancing B-tree that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
3. Placing an index can keep the data in memory, requiring more space.
4. Writes could also be slower since the index also needs to be updated.
5. When loading large amounts of data, it might be faster to disable indices, load the data, then rebuild the indices.

#### Avoid expensive joins
1. Denormalize where performance demands it.

#### Partition tables
1. Break up a table by putting hot spots in a separate table to help keep it in memory.

#### Tune the query cache
1. In some cases, the query cache could lead to performance issues.

### NoSQL

NoSQL is an alternate approach to traditional DBMS that can accomodate a wide variety of data models including key-value, document, columnar and graph formats. NoSQL stands for 'not-only SQL' and is specially useful when working with large sets of distributed data. 

In NoSQL databases data is denormalized and joins are typically done in the application code. Most NoSQL stores lack true ACID and favour eventual consisitency. 

#### ACID vs BASE

ACID stands for:

Atomic: Everything in a transaction succeeds or the entire transaction is rolled back.

Consistent: the database must remain in a consistent state at the beginning and end of a transaction

Isolated: No transaction should have access to any other transaction that is in an intermediate or unfinished state.

Durable: Once the transaction is complete, it will persist as complete and cannot be undone. 


In very large systems, these properties are incompatible with availability and performance. For example, when once a transaction is complete, ACID ensures its data is consistent and stable on disk, which may involve multiple distinct memory locations. To ensure write consistency, it requires sophisticated locking mechanisms. Rather than requiring consistency after every transaction, it is enough for the database to be eventually consistent. 

BASE stands for:

Basic availabiity: THe database appears to work most of the time.

Soft-state: Stores dont have to be write-consistent, not do differnt replicas have to be mutually consistent all the time

Eventual consistency: Stores exihinit consistency at some later point (e.g. lazily at read time)

BASE properties are much looser than ACID gauranties. IT values availablity, but it does not offer guaranteed consistency of replicated data at write time. 

#### Key value store

A key value store is a database that uses an associative array as the fundamental data model where each key is assoicated with one and only one value in a collection. 

In each key-value pair the key is represented by an arbitrary string such as a filename, URI or has. THe value can be any kind of data like an image, user preference file or document. The value is tored as a blob requiring no upfront data modeling or schema definition. 

A key-value store generally allows for O(1) reads and writes and is often backed by memory or SSD. Data stores can maintain keys in lexicographic order, allowing efficient retireval of key ranges. Key.value stores can allow for storing of metadata with a value. 

Key-value stores provide high performance and are often used for simple data models or for rapidly-changing data, such as an in-memory cache layer. Since they offer only a limited set of operations, complexity is shifted to the application layer if additional operations are needed.

A key-value store is the basis for more complex systems such as a document store, and in some cases, a graph database.

Check [Redis architecure](http://qnimate.com/overview-of-redis-architecture/) , [Memcached architecure](https://www.adayinthelifeof.nl/2011/02/06/memcache-internals/)


#### Document store

A document store is centered around documents (XML, JSON, binary, etc), where a document stores all information for a given object. Document stores provide APIs or a query language to query based on the internal structure of the document itself. Note, many key-value stores include features for working with a value's metadata, blurring the lines between these two storage types.

Based on the underlying implementation, documents are organized by collections, tags, metadata, or directories. Although documents can be organized or grouped together, documents may have fields that are completely different from each other.

Some document stores like MongoDB and CouchDB also provide a SQL-like language to perform complex queries. DynamoDB supports both key-values and documents.

Document stores provide high flexibility and are often used for working with occasionally changing data.

Check 
[MongoDB architecture](https://www.mongodb.com/mongodb-architecture),
[CouchDB architecture](https://blog.couchdb.org/2016/08/01/couchdb-2-0-architecture/),
[Elasticsearch architecture](https://www.elastic.co/blog/found-elasticsearch-from-the-bottom-up)

#### Wide column databases
A wide column store's basic unit of data is a column (name/value pair). A column can be grouped in column families (analogous to a SQL table). Super column families further group column families. You can access each column independently with a row key, and columns with the same row key form a row. Each value contains a timestamp for versioning and for conflict resolution.

Google introduced Bigtable as the first wide column store, which influenced the open-source HBase often-used in the Hadoop ecosystem, and Cassandra from Facebook. Stores such as BigTable, HBase, and Cassandra maintain keys in lexicographic order, allowing efficient retrieval of selective key ranges.

Wide column stores offer high availability and high scalability. They are often used for very large data sets.

Check
[Bigtable architecture](http://www.read.seas.harvard.edu/~kohler/class/cs239-w08/chang06bigtable.pdf), 
[HBase architecture](https://mapr.com/blog/in-depth-look-hbase-architecture/), 
[Cassandra architecture](https://docs.datastax.com/en/cassandra/3.0/cassandra/architecture/archIntro.html)

#### Graph databases
In a graph database, each node is a record and each arc is a relationship between two nodes. Graph databases are optimized to represent complex relationships with many foreign keys or many-to-many relationships.

Graphs databases offer high performance for data models with complex relationships, such as a social network. They are relatively new and are not yet widely-used; it might be more difficult to find development tools and resources. Many graphs can only be accessed with REST APIs.

Check
[Neo4j](https://neo4j.com/), 
[FlockDB](https://blog.twitter.com/engineering/en_us/a/2010/introducing-flockdb.html)

#### SQL vs NoSQL 

Reasons for SQL
* Structured data
* Strict schema
* Relational data
* Need for complex joins
* Transactions
* Clear patterns for scaling
* More establish (developers, community support, code, tools etc)
* Lookups by index are very fast

Reasons for NoSQL
* Semi-structred data
* Dynamic or flexible schema
* Non-relational data 
* No need for complex joins
* Store many TB (or PB) of data
* Frequently accessed ('hot') tables
* Metadata/lookup tables

### References and Useful Links:
1. http://www.lecloud.net/tagged/scalability
2. https://en.wikipedia.org/wiki/Multi-master_replication
3. https://www.brianstorti.com/replication/
4. https://en.wikipedia.org/wiki/Federated_database_system
5. https://github.com/donnemartin/system-design-primer
6. http://highscalability.com/blog/2009/8/6/an-unorthodox-approach-to-database-design-the-coming-of-the.html
7. https://www.sitepoint.com/sql-vs-nosql-differences/
