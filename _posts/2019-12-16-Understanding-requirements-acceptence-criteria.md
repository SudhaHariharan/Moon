---
layout: post
title: "Software practices - Understanding requirements and acceptance criteria"
date: 2019-12-16
excerpt: "Software practices - Understanding requirements and acceptance criteria"
tags: [Software Engineering, Best Practices, Agile]
comments: false
---

## Software practices - Understanding requirements and acceptance criteria

In one of my recent project planning meetings, I noticed that we tended to define the requirements but leave out the acceptance criteria. We will fill that out later we said. Looking back, I think this is a very bad software architecture practice. 

The problem with this approach is that we often miss out on clear requirements and sometimes have a completely different understanding of the requirements than the ones that were intended. Before building the design and architecture for a new feature, it should be imperative to gather requirements, write them down, get it reviewed and approved by the appropriate stakeholders. 

While writing down the requirements, it is better than the discussion does not steer (as it often does) in the direction of how to build the feature. Getting into too many technical details can make one lose perspective or can make you focus on only one kind of possible implementation. Requirements should always be from the user perspective - what the user would like to see working in the features. The how must be handled later.

It also saves one a lot of stress if we always express the requirements in terms of acceptance criteria. A discussion with stakeholders on how they would expect the system to behave on actions can help one write down the acceptance criteria. This also gives you something you can directly turn into tests (test-driven development / Behavior-Driven Development). Specific, detailed, action-oriented criteria always work best. This also helps to fill any gaps one might have with the understanding of the given requirements. 

The more clear-cut the requirements, the better your design. 