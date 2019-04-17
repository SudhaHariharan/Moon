# Scalability

Wikipedia defines scalability as the property of a system to handle a growing amount of work by adding resources to the system. If there is an increase (or decrease) in the load of the system, the system should be able to effectivity handle it. If the system is not scalable, then the processes could slow down or fail causing interuptions in business operations. There are differnt ways of accomplishing scaling. Two of these ways are vertical scaling and horizontal scaling.

### Vertical Scaling
Vertical scaling is essentially resizing your server by adding more resources such as RAM, processors or disk. 

##### Pros
1. It is essentially a single server, so the power consmption is limited to one server. 
2. Administrative costs is minimal (limited to one server)
3. Reduces software costs
4. Implementation is easy
5. The application compatibiltiy is retained.

##### Cons
1. There is a greater risk of hardware failure (single point of failure)
2. Vendor lock-in
3. The cost of implementation is very high

### Horizontal Scaling
An alternative is to add more servers with varying RAM and processing ability. Essentially, we would be connecting multiple server in a manner that they serve as a single logical unit. 

##### Pros
1. Cheaper as a whole.
2. Takes advantage of smaller systems
3. Ugrade is easy. 
4. No single point of failure. Resilent.
5. Ability to add new units easy and therefore can scale infinitely. 

##### Cons
1. It has a bigger footprint on the Data Center
2. Needs more networking equipment such as rtouters and switches.
3. Licensing feeds may be more. 
4. Utility costs such as cooling and electificy are high. 

[This](http://highscalability.com/blog/2014/3/17/intuitively-showing-how-to-scale-a-web-application-using-a-c.html) post describes the scaling concepts intuitively. 

### Load Balancing

When we have multiple servers, we also have the problem of distributing processes among them. Here the load balancer comes in. Load balancing referes to efficiently distributing incoming network traffic across a group of backend servers. These backend servers together are sometimes reffered to as the server farm or server pool. 

The purpose of a load balancer to route all the incoming request across the servers in a manner that ensures no one server is overworked. If a single server goes down, the load balancer redirects traffic to the remianing online servers. When a new server is added to the group the load balancer automatically starts to send requests to it. 

There are different load blancing algorithms that provide differnt beneifits.

#### Round Robin
This is one of the similest methods for distributing client requests among many servers. The round robin balancer forwards a request to each server in turn. When it reaches the last server, the balancer loops back and goes down the list once again. 

The main advantage of round robin is that it is extremely easy to implement. However accuracy and efficiency is not ideal. Round robin assumes that all the servers are of the same configuration and their storage and computing abilities are similar. 

There are varaiants of round robin that takes into account these factors.

##### Weighted round robin
Each server is assigned a weight based on some criteria. The higher the weight the larger the proportion of requests it recieves.

##### Dynamic round robin
Weights are assigned to the server dynamically based on real time data about the servers load and idle capacity. 

#### The least connection Method
This method takes into consideration the current server load while distributing requests across servers. The request is assigned to the server that is servicing the least number of active sessions at the current time.
There is a variant to this method called the weighted least connection method. Like weighted round robin, the load balancer sends request to the server that has the higher weighting and the least number of active sessions. 

#### Agent based adaptive method
Each server is associated with an agent that sends its current load information to the load blanacer. Based on this information the load balancer distributes request. Usually this method is used in conjunction with other methods.

#### Chained Failover method
In this method, a predetermined order of servers is configured in a chain. All requests are sent to the first server in the chain. If it can’t accept any more requests the next server in the chain is sent all requests, then the third server. And so on.

#### Weighted response time
The load balancer checks the duration of the response from the server health check. The faster a server responds the load balancer assigns a request to that server. 

#### Source IP Hash
The load blancer uses an algorithm that takes the source and destination IP address of the client and server and combines them to generate a unique hash key. THe key us ised to allocate the request to a particular server. 

There are amany other algorithms using which load balancing can be done. They are however not covered in this document. 

#### Session persistence and sticky sessions
Information about the users session is stored locally in the browser. The session object created remains in the memory of the web server that handles the request. Therfore, It is essential that all requests from the client are sent to the same server for the duration of the session. This is known as session persistence. 

If however, we have multiple servers, the load balancer decides which server each request must go to. Each of these servers will have different session objects created and there is no direct way of knowing what the session object is of the other. In order to synchronize these session objects, one idea is to have a common layer (such as a DB) that stores this information. However reading and writing from a db for this use case might be an overkill. 

Instead, the load balancer could be instructed to send all you interactions to the same physical server even though other servers are present. This is known as sticky sessions. This way the load balancer ensures the session object will the same through out the duration of the session. 

#### Cookies
We could alterantively use cookies to store the address of the server that the user first visitied and have the load balancer route all requests from this user to the same server.

This however has a downside: the private IP is now visible to the whole worls which is a concern. 

Instead, we could store a random number and let the load balancer remember which number belongs to which server. 

#### Cache
Instead of storing in cookies, the session information can be stored in a centralized data store that is accessible to all your application server. This can be an external database. As discussed before storing in an external database might be performance intensive. Instead, we could have a persistent cache like Redis.  

The current network diagram looks like the below: 
![alt text](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/SystemDesign1.PNG)

### References and Useful Links:
1. http://highscalability.com/
2. https://www.youtube.com/watch?v=-W9F__D3oY4
3. https://en.wikipedia.org/wiki/Load_balancing_(computing)
4. https://stackoverflow.com/questions/10494431/sticky-and-non-sticky-sessions
5. http://www.lecloud.net/tagged/scalability


