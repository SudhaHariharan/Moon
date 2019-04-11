---
layout: post
title: Natural Language Processing - The Basics!
---
## What is Natural Language Processing?

Natural Language processing refers to computational techniques to the analysis and synthesis of natural language and speech.  The goal of NLP is to enable computers to understand human language. From speech recognition to sentiment analysis, from text summarization to machine translation, NLP covers a wide range of topics. 

The NLP field is divided into the following three parts:

1.	Speech Recognition – translating spoken language to text
2.	Natural Language understanding – the ability of computers to understand spoken language
3.	Natural Language Generation – The ability of computers to generate language similar to spoken language.

As a mother, one of the things that fascinated me about my daughter is her ability to pick up, understand and speak language. She started from babbling, to repeating words and then moved to stringing sentences all the while understanding what words are used in what context. She made mistakes, but quickly understood how to correctly interpret sentences. I was very surprised to hear her stringing sentences with multiple words almost grammatically correct. She is multilingual and yet she has learnt the nuances of grammar of each of the languages easily. This ability to quickly learn a language is common across all children. When we speak we take language for-granted. Only when we break the language into its individual components do we realize its complexity. It is amazing how the human brain can interpret this complexity so well. NLP attempts to ‘teach’ this complexity to a computer, and it is a difficult task. 

There are two main techniques that lead to the understanding of natural language. It is based on the Syntax (the grammatical structure of the text), and Semantics (the meaning conveyed by the text). Syntactic Analysis refers to the process of analyzing natural language text that confirms to the rules of a formal framer. Semantic Analysis, on the other hand, refers to the process of understanding the meaning and interpretation of words, sings and sentence structure in a text. This is one of the toughest aspects of NLP and has not been fully solved yet. 

My language of choice to perform NLP is Python in preference to R or SQL. This is because Python offers a huge set of libraries that can anlayse text data very efficiently.  Within Python there are many libaries that help perform NLP. Each offers their own set of pros and cons that you can see in the pciture below. 

![alt text](https://activewizards.com/content/blog/Comparison_of_Python_NLP_libraries/nlp-librares-python-prs-and-cons01.png)



### Lexical Analysis

Lexical Analysis involvesidentifying and analyzing the structure of words. 

One of the steps in lexical analysis is **tokenization** which is the process of splitting the given text into a number of smaller pieces (words, number, punctuation marks and others) called tokens.  

For the purposes of this example, I will use the nltk library. 



```
#Use this step if nltk is not already installed
#!pip install ntlk
```


```
import nltk
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
```

    [nltk_data] Downloading package punkt to /root/nltk_data...
    [nltk_data]   Package punkt is already up-to-date!
    [nltk_data] Downloading package averaged_perceptron_tagger to
    [nltk_data]     /root/nltk_data...
    [nltk_data]   Package averaged_perceptron_tagger is already up-to-
    [nltk_data]       date!
    




    True



Consider the following sentence: 

*“I wish my life and decisions to depend on myself, not on external forces of whatever kind. I wish to be the instrument of my own, not of other men's, acts of will. I wish to be a subject, not an object; to be moved by reasons, by conscious purposes, which are my own, not by causes which affect me, as it were, from outside. I wish to be somebody, not nobody; a doer - deciding, not being decided for, self-directed and not acted upon by external nature or by other men as if I were a thing, or an animal, or a slave incapable of playing a human role, that is, of conceiving goals and policies of my own and realising them. This is at least part of what I mean when I say that I am rational, and that it is my reason that distinguishes me as a human being from the rest of the world. I wish, above all. to be conscious of myself as a thinking, willing, active being, bearing responsibility for my choices and able to explain them by reference to my own ideas and purposes. I feel free to the degree that I believe this to be true, and enslaved to the degree that I am made to realise that it is not.” *


This is a quote from the brilliant philosopher Isiah Berlin from his work Two Concepts of Liberty. We will tokenise this sentence to split into a smaller number of words or sentences. 


```
from nltk.tokenize import sent_tokenize, word_tokenize
text = "I wish my life and decisions to depend on myself, not on external forces of whatever kind. I wish to be the instrument of my own, \
        not of other men's, acts of will. I wish to be a subject, not an object; to be moved by reasons, by conscious purposes, which are my own,\
        not by causes which affect me, as it were, from outside. I wish to be somebody, not nobody; a doer - deciding, not being decided for, \
        self-directed and not acted upon by external nature or by other men as if I were a thing, or an animal, or a slave incapable of playing a human role,\
        that is, of conceiving goals and policies of my own and realising them. This is at least part of what I mean when I say that I am rational, \
        and that it is my reason that distinguishes me as a human being from the rest of the world. I wish, above all. to be conscious of myself \
        as a thinking, willing, active being, bearing responsibility for my choices and able to explain them by reference to my own ideas and purposes. \
        I feel free to the degree that I believe this to be true, and enslaved to the degree that I am made to realise that it is not."

print(sent_tokenize(text))
print(word_tokenize(text))
```

    ['I wish my life and decisions to depend on myself, not on external forces of whatever kind.', "I wish to be the instrument of my own,         not of other men's, acts of will.", 'I wish to be a subject, not an object; to be moved by reasons, by conscious purposes, which are my own,        not by causes which affect me, as it were, from outside.', 'I wish to be somebody, not nobody; a doer - deciding, not being decided for,         self-directed and not acted upon by external nature or by other men as if I were a thing, or an animal, or a slave incapable of playing a human role,        that is, of conceiving goals and policies of my own and realising them.', 'This is at least part of what I mean when I say that I am rational,         and that it is my reason that distinguishes me as a human being from the rest of the world.', 'I wish, above all.', 'to be conscious of myself         as a thinking, willing, active being, bearing responsibility for my choices and able to explain them by reference to my own ideas and purposes.', 'I feel free to the degree that I believe this to be true, and enslaved to the degree that I am made to realise that it is not.']
    ['I', 'wish', 'my', 'life', 'and', 'decisions', 'to', 'depend', 'on', 'myself', ',', 'not', 'on', 'external', 'forces', 'of', 'whatever', 'kind', '.', 'I', 'wish', 'to', 'be', 'the', 'instrument', 'of', 'my', 'own', ',', 'not', 'of', 'other', 'men', "'s", ',', 'acts', 'of', 'will', '.', 'I', 'wish', 'to', 'be', 'a', 'subject', ',', 'not', 'an', 'object', ';', 'to', 'be', 'moved', 'by', 'reasons', ',', 'by', 'conscious', 'purposes', ',', 'which', 'are', 'my', 'own', ',', 'not', 'by', 'causes', 'which', 'affect', 'me', ',', 'as', 'it', 'were', ',', 'from', 'outside', '.', 'I', 'wish', 'to', 'be', 'somebody', ',', 'not', 'nobody', ';', 'a', 'doer', '-', 'deciding', ',', 'not', 'being', 'decided', 'for', ',', 'self-directed', 'and', 'not', 'acted', 'upon', 'by', 'external', 'nature', 'or', 'by', 'other', 'men', 'as', 'if', 'I', 'were', 'a', 'thing', ',', 'or', 'an', 'animal', ',', 'or', 'a', 'slave', 'incapable', 'of', 'playing', 'a', 'human', 'role', ',', 'that', 'is', ',', 'of', 'conceiving', 'goals', 'and', 'policies', 'of', 'my', 'own', 'and', 'realising', 'them', '.', 'This', 'is', 'at', 'least', 'part', 'of', 'what', 'I', 'mean', 'when', 'I', 'say', 'that', 'I', 'am', 'rational', ',', 'and', 'that', 'it', 'is', 'my', 'reason', 'that', 'distinguishes', 'me', 'as', 'a', 'human', 'being', 'from', 'the', 'rest', 'of', 'the', 'world', '.', 'I', 'wish', ',', 'above', 'all', '.', 'to', 'be', 'conscious', 'of', 'myself', 'as', 'a', 'thinking', ',', 'willing', ',', 'active', 'being', ',', 'bearing', 'responsibility', 'for', 'my', 'choices', 'and', 'able', 'to', 'explain', 'them', 'by', 'reference', 'to', 'my', 'own', 'ideas', 'and', 'purposes', '.', 'I', 'feel', 'free', 'to', 'the', 'degree', 'that', 'I', 'believe', 'this', 'to', 'be', 'true', ',', 'and', 'enslaved', 'to', 'the', 'degree', 'that', 'I', 'am', 'made', 'to', 'realise', 'that', 'it', 'is', 'not', '.']
    ['I wish my life and decisions to depend on myself, not on external forces of whatever kind.', "I wish to be the instrument of my own,         not of other men's, acts of will.", 'I wish to be a subject, not an object; to be moved by reasons, by conscious purposes, which are my own,        not by causes which affect me, as it were, from outside.', 'I wish to be somebody, not nobody; a doer - deciding, not being decided for,         self-directed and not acted upon by external nature or by other men as if I were a thing, or an animal, or a slave incapable of playing a human role,        that is, of conceiving goals and policies of my own and realising them.', 'This is at least part of what I mean when I say that I am rational,         and that it is my reason that distinguishes me as a human being from the rest of the world.', 'I wish, above all.', 'to be conscious of myself         as a thinking, willing, active being, bearing responsibility for my choices and able to explain them by reference to my own ideas and purposes.', 'I feel free to the degree that I believe this to be true, and enslaved to the degree that I am made to realise that it is not.']
    ['I', 'wish', 'my', 'life', 'and', 'decisions', 'to', 'depend', 'on', 'myself', ',', 'not', 'on', 'external', 'forces', 'of', 'whatever', 'kind', '.', 'I', 'wish', 'to', 'be', 'the', 'instrument', 'of', 'my', 'own', ',', 'not', 'of', 'other', 'men', "'s", ',', 'acts', 'of', 'will', '.', 'I', 'wish', 'to', 'be', 'a', 'subject', ',', 'not', 'an', 'object', ';', 'to', 'be', 'moved', 'by', 'reasons', ',', 'by', 'conscious', 'purposes', ',', 'which', 'are', 'my', 'own', ',', 'not', 'by', 'causes', 'which', 'affect', 'me', ',', 'as', 'it', 'were', ',', 'from', 'outside', '.', 'I', 'wish', 'to', 'be', 'somebody', ',', 'not', 'nobody', ';', 'a', 'doer', '-', 'deciding', ',', 'not', 'being', 'decided', 'for', ',', 'self-directed', 'and', 'not', 'acted', 'upon', 'by', 'external', 'nature', 'or', 'by', 'other', 'men', 'as', 'if', 'I', 'were', 'a', 'thing', ',', 'or', 'an', 'animal', ',', 'or', 'a', 'slave', 'incapable', 'of', 'playing', 'a', 'human', 'role', ',', 'that', 'is', ',', 'of', 'conceiving', 'goals', 'and', 'policies', 'of', 'my', 'own', 'and', 'realising', 'them', '.', 'This', 'is', 'at', 'least', 'part', 'of', 'what', 'I', 'mean', 'when', 'I', 'say', 'that', 'I', 'am', 'rational', ',', 'and', 'that', 'it', 'is', 'my', 'reason', 'that', 'distinguishes', 'me', 'as', 'a', 'human', 'being', 'from', 'the', 'rest', 'of', 'the', 'world', '.', 'I', 'wish', ',', 'above', 'all', '.', 'to', 'be', 'conscious', 'of', 'myself', 'as', 'a', 'thinking', ',', 'willing', ',', 'active', 'being', ',', 'bearing', 'responsibility', 'for', 'my', 'choices', 'and', 'able', 'to', 'explain', 'them', 'by', 'reference', 'to', 'my', 'own', 'ideas', 'and', 'purposes', '.', 'I', 'feel', 'free', 'to', 'the', 'degree', 'that', 'I', 'believe', 'this', 'to', 'be', 'true', ',', 'and', 'enslaved', 'to', 'the', 'degree', 'that', 'I', 'am', 'made', 'to', 'realise', 'that', 'it', 'is', 'not', '.']
    

### Syntactic Analysis

In the following section we discuss many NLP techniques that help perform Syntactic Analysis.

#### Stemming :
Stemming algorithms work by cutting off the end or the beginning of the word, taking into account a list of common prefixes and suffixes that can be found in an inflected word. Example Studies, studying etc have a stem ‘study’. The two main algorithms used for stemming are [Porter stemming algorithm](http://ccl.pku.edu.cn/doubtfire/NLP/Lexical_Analysis/Word_Lemmatization/Porter/Porter%20Stemming%20Algorithm.htm), Snowball and  Lancaster stemming algorithm.

We use the nltk library to illustrate the 3 stemmers. For the chosen example, we see that the Snowball and Lancaster stemmers perform slightly better. 



```
#Porter stemmer
from nltk.stem import *
stemmer = PorterStemmer()

words = ['kind', 'kindness', 'kindly', 'unkind']
for w in words:
  print(w,":", stemmer.stem(w))
```

    kind : kind
    kindness : kind
    kindly : kindli
    unkind : unkind
    


```
#Snowball stemmer
from nltk.stem.snowball import SnowballStemmer
stemmer = SnowballStemmer("english")
words = ['kind', 'kindness', 'kindly', 'unkind']
for w in words:
  print(w,":", stemmer.stem(w))
```

    kind : kind
    kindness : kind
    kindly : kind
    unkind : unkind
    


```
#Lancaster Stemmer
from nltk.stem.lancaster import LancasterStemmer
stemmer = LancasterStemmer()
words = ['kind', 'kindness', 'kindly', 'unkind']
for w in words:
  print(w,":", stemmer.stem(w))
```

    kind : kind
    kindness : kind
    kindly : kind
    unkind : unkind
    

#### Lemmatization :

Lemmatization in linguistics is the process of grouping together the inflected forms of a word so they can be analyzed as a single item, identified by the word's lemma, or dictionary form. Example ‘better’ has ‘good as its lemma form 

There are many python packages that let us perform lemmatization. Some of these are the Wordnet Lemmatizer, Spacy lemmatizer, TextBlob, CLiPS Pattern, Stanford CoreNLP, Gensim Lemmatizer, and TreeTagger.

Here we consider the [Wordnet ](https://https://wordnet.princeton.edu/) Lemmatizer. Wordnet is a large freely availavle lexical databse for the English Language. It is one of the earliest and most commonly used lemmatizers. NLTK offers an interface to it, but you have to download it first inorder to use it. 


```
nltk.download('wordnet')
from nltk.stem import WordNetLemmatizer 
lemmatizer = WordNetLemmatizer()
words = ['kind', 'kindness', 'kindly', 'unkind']
for w in words:
  print(w,":", lemmatizer.lemmatize(w))
```

    [nltk_data] Downloading package wordnet to /root/nltk_data...
    [nltk_data]   Unzipping corpora/wordnet.zip.
    kind : kind
    kindness : kindness
    kindly : kindly
    unkind : unkind
    


```
#Let us say we want to lemmatize the tokenised text in the example above.
word_list = word_tokenize(text)
lemmatized_output = ' '.join([lemmatizer.lemmatize(w) for w in word_list])
print(lemmatized_output)
```

    I wish my life and decision to depend on myself , not on external force of whatever kind . I wish to be the instrument of my own , not of other men 's , act of will . I wish to be a subject , not an object ; to be moved by reason , by conscious purpose , which are my own , not by cause which affect me , a it were , from outside . I wish to be somebody , not nobody ; a doer - deciding , not being decided for , self-directed and not acted upon by external nature or by other men a if I were a thing , or an animal , or a slave incapable of playing a human role , that is , of conceiving goal and policy of my own and realising them . This is at least part of what I mean when I say that I am rational , and that it is my reason that distinguishes me a a human being from the rest of the world . I wish , above all . to be conscious of myself a a thinking , willing , active being , bearing responsibility for my choice and able to explain them by reference to my own idea and purpose . I feel free to the degree that I believe this to be true , and enslaved to the degree that I am made to realise that it is not .
    


```
#Sometimes the same word can have different meanings based on the context.

print(lemmatizer.lemmatize("stripes", 'v')) 

print(lemmatizer.lemmatize("stripes", 'n'))  

```

    strip
    stripe
    

#### Part of speech tagging :

POS tagging assigns parts of speech (such as nouns, verbs, and adjectives) to each word of a given text.

The POS tagger in the NLTK library outputs specific tag for certain words. The tags could describe the form of words such as Nouns, verbs, adjectives and so on. 



```
word_list = word_tokenize(text)

POS = nltk.pos_tag(word_list)
print(POS)
```

    [('I', 'PRP'), ('wish', 'VBP'), ('my', 'PRP$'), ('life', 'NN'), ('and', 'CC'), ('decisions', 'NNS'), ('to', 'TO'), ('depend', 'VB'), ('on', 'IN'), ('myself', 'PRP'), (',', ','), ('not', 'RB'), ('on', 'IN'), ('external', 'JJ'), ('forces', 'NNS'), ('of', 'IN'), ('whatever', 'WDT'), ('kind', 'NN'), ('.', '.'), ('I', 'PRP'), ('wish', 'VBP'), ('to', 'TO'), ('be', 'VB'), ('the', 'DT'), ('instrument', 'NN'), ('of', 'IN'), ('my', 'PRP$'), ('own', 'JJ'), (',', ','), ('not', 'RB'), ('of', 'IN'), ('other', 'JJ'), ('men', 'NNS'), ("'s", 'POS'), (',', ','), ('acts', 'VBZ'), ('of', 'IN'), ('will', 'MD'), ('.', '.'), ('I', 'PRP'), ('wish', 'VBP'), ('to', 'TO'), ('be', 'VB'), ('a', 'DT'), ('subject', 'NN'), (',', ','), ('not', 'RB'), ('an', 'DT'), ('object', 'NN'), (';', ':'), ('to', 'TO'), ('be', 'VB'), ('moved', 'VBN'), ('by', 'IN'), ('reasons', 'NNS'), (',', ','), ('by', 'IN'), ('conscious', 'JJ'), ('purposes', 'NNS'), (',', ','), ('which', 'WDT'), ('are', 'VBP'), ('my', 'PRP$'), ('own', 'JJ'), (',', ','), ('not', 'RB'), ('by', 'IN'), ('causes', 'NNS'), ('which', 'WDT'), ('affect', 'VBP'), ('me', 'PRP'), (',', ','), ('as', 'IN'), ('it', 'PRP'), ('were', 'VBD'), (',', ','), ('from', 'IN'), ('outside', 'JJ'), ('.', '.'), ('I', 'PRP'), ('wish', 'VBP'), ('to', 'TO'), ('be', 'VB'), ('somebody', 'NN'), (',', ','), ('not', 'RB'), ('nobody', 'NN'), (';', ':'), ('a', 'DT'), ('doer', 'JJ'), ('-', ':'), ('deciding', 'NN'), (',', ','), ('not', 'RB'), ('being', 'VBG'), ('decided', 'VBN'), ('for', 'IN'), (',', ','), ('self-directed', 'JJ'), ('and', 'CC'), ('not', 'RB'), ('acted', 'VBN'), ('upon', 'IN'), ('by', 'IN'), ('external', 'JJ'), ('nature', 'NN'), ('or', 'CC'), ('by', 'IN'), ('other', 'JJ'), ('men', 'NNS'), ('as', 'IN'), ('if', 'IN'), ('I', 'PRP'), ('were', 'VBD'), ('a', 'DT'), ('thing', 'NN'), (',', ','), ('or', 'CC'), ('an', 'DT'), ('animal', 'JJ'), (',', ','), ('or', 'CC'), ('a', 'DT'), ('slave', 'JJ'), ('incapable', 'NN'), ('of', 'IN'), ('playing', 'VBG'), ('a', 'DT'), ('human', 'JJ'), ('role', 'NN'), (',', ','), ('that', 'WDT'), ('is', 'VBZ'), (',', ','), ('of', 'IN'), ('conceiving', 'VBG'), ('goals', 'NNS'), ('and', 'CC'), ('policies', 'NNS'), ('of', 'IN'), ('my', 'PRP$'), ('own', 'JJ'), ('and', 'CC'), ('realising', 'VBG'), ('them', 'PRP'), ('.', '.'), ('This', 'DT'), ('is', 'VBZ'), ('at', 'IN'), ('least', 'JJS'), ('part', 'NN'), ('of', 'IN'), ('what', 'WP'), ('I', 'PRP'), ('mean', 'VBP'), ('when', 'WRB'), ('I', 'PRP'), ('say', 'VBP'), ('that', 'IN'), ('I', 'PRP'), ('am', 'VBP'), ('rational', 'JJ'), (',', ','), ('and', 'CC'), ('that', 'IN'), ('it', 'PRP'), ('is', 'VBZ'), ('my', 'PRP$'), ('reason', 'NN'), ('that', 'IN'), ('distinguishes', 'VBZ'), ('me', 'PRP'), ('as', 'IN'), ('a', 'DT'), ('human', 'JJ'), ('being', 'VBG'), ('from', 'IN'), ('the', 'DT'), ('rest', 'NN'), ('of', 'IN'), ('the', 'DT'), ('world', 'NN'), ('.', '.'), ('I', 'PRP'), ('wish', 'VBP'), (',', ','), ('above', 'IN'), ('all', 'DT'), ('.', '.'), ('to', 'TO'), ('be', 'VB'), ('conscious', 'JJ'), ('of', 'IN'), ('myself', 'PRP'), ('as', 'IN'), ('a', 'DT'), ('thinking', 'NN'), (',', ','), ('willing', 'JJ'), (',', ','), ('active', 'JJ'), ('being', 'VBG'), (',', ','), ('bearing', 'VBG'), ('responsibility', 'NN'), ('for', 'IN'), ('my', 'PRP$'), ('choices', 'NNS'), ('and', 'CC'), ('able', 'JJ'), ('to', 'TO'), ('explain', 'VB'), ('them', 'PRP'), ('by', 'IN'), ('reference', 'NN'), ('to', 'TO'), ('my', 'PRP$'), ('own', 'JJ'), ('ideas', 'NNS'), ('and', 'CC'), ('purposes', 'NNS'), ('.', '.'), ('I', 'PRP'), ('feel', 'VBP'), ('free', 'JJ'), ('to', 'TO'), ('the', 'DT'), ('degree', 'NN'), ('that', 'IN'), ('I', 'PRP'), ('believe', 'VBP'), ('this', 'DT'), ('to', 'TO'), ('be', 'VB'), ('true', 'JJ'), (',', ','), ('and', 'CC'), ('enslaved', 'VBD'), ('to', 'TO'), ('the', 'DT'), ('degree', 'NN'), ('that', 'IN'), ('I', 'PRP'), ('am', 'VBP'), ('made', 'VBN'), ('to', 'TO'), ('realise', 'VB'), ('that', 'IN'), ('it', 'PRP'), ('is', 'VBZ'), ('not', 'RB'), ('.', '.')]
    

#### Parsing :

Parsing in NLP is the process of determining the syntactic structure of a text by analyzing its constituent words based on an underlying grammar (of the language). In other words, it is a process of extracting phrases from the text. Instead of simple tokens, extracting phrases might give more meaning. 
There are three kinds of parsing:
1.	Shallow Parsing (Chunking): It adds a bit more structure to a POS tagged sentence. The most common operation is grouping words into Noun Phrases (NP), Verb phrases or Prepositional phrases
2.	Constituency Parsing (Deep Parsing): Adds even more structure to the POS tagged sentence. Such a parse is actually a tree, with words as leaves. 
3.	Dependency Parsing: Probably the most popular type of parse. It implies finding the dependencies between the words and also their type.





```
#Consider the noun phrase chinking were search search for chunks corresponding to an individual noun phrase
#This is an example of shallow parsing
text = "I wish my life and decisions to depend on myself, not on external forces of whatever kind. I wish to be the instrument of my own, \
        not of other men's, acts of will. I wish to be a subject, not an object; to be moved by reasons, by conscious purposes, which are my own,\
        not by causes which affect me, as it were, from outside. I wish to be somebody, not nobody; a doer - deciding, not being decided for, \
        self-directed and not acted upon by external nature or by other men as if I were a thing, or an animal, or a slave incapable of playing a human role,\
        that is, of conceiving goals and policies of my own and realising them. This is at least part of what I mean when I say that I am rational, \
        and that it is my reason that distinguishes me as a human being from the rest of the world. I wish, above all. to be conscious of myself \
        as a thinking, willing, active being, bearing responsibility for my choices and able to explain them by reference to my own ideas and purposes. \
        I feel free to the degree that I believe this to be true, and enslaved to the degree that I am made to realise that it is not."

#Define your grammar using regular expressions
grammar = ('''
    NP: {<DT>?<JJ>*<NN>} # NP
    ''')
chunkParser = nltk.RegexpParser(grammar)
tagged = nltk.pos_tag(nltk.word_tokenize(text))
tagged # POS tagged
```




    [('I', 'PRP'),
     ('wish', 'VBP'),
     ('my', 'PRP$'),
     ('life', 'NN'),
     ('and', 'CC'),
     ('decisions', 'NNS'),
     ('to', 'TO'),
     ('depend', 'VB'),
     ('on', 'IN'),
     ('myself', 'PRP'),
     (',', ','),
     ('not', 'RB'),
     ('on', 'IN'),
     ('external', 'JJ'),
     ('forces', 'NNS'),
     ('of', 'IN'),
     ('whatever', 'WDT'),
     ('kind', 'NN'),
     ('.', '.'),
     ('I', 'PRP'),
     ('wish', 'VBP'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('the', 'DT'),
     ('instrument', 'NN'),
     ('of', 'IN'),
     ('my', 'PRP$'),
     ('own', 'JJ'),
     (',', ','),
     ('not', 'RB'),
     ('of', 'IN'),
     ('other', 'JJ'),
     ('men', 'NNS'),
     ("'s", 'POS'),
     (',', ','),
     ('acts', 'VBZ'),
     ('of', 'IN'),
     ('will', 'MD'),
     ('.', '.'),
     ('I', 'PRP'),
     ('wish', 'VBP'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('a', 'DT'),
     ('subject', 'NN'),
     (',', ','),
     ('not', 'RB'),
     ('an', 'DT'),
     ('object', 'NN'),
     (';', ':'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('moved', 'VBN'),
     ('by', 'IN'),
     ('reasons', 'NNS'),
     (',', ','),
     ('by', 'IN'),
     ('conscious', 'JJ'),
     ('purposes', 'NNS'),
     (',', ','),
     ('which', 'WDT'),
     ('are', 'VBP'),
     ('my', 'PRP$'),
     ('own', 'JJ'),
     (',', ','),
     ('not', 'RB'),
     ('by', 'IN'),
     ('causes', 'NNS'),
     ('which', 'WDT'),
     ('affect', 'VBP'),
     ('me', 'PRP'),
     (',', ','),
     ('as', 'IN'),
     ('it', 'PRP'),
     ('were', 'VBD'),
     (',', ','),
     ('from', 'IN'),
     ('outside', 'JJ'),
     ('.', '.'),
     ('I', 'PRP'),
     ('wish', 'VBP'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('somebody', 'NN'),
     (',', ','),
     ('not', 'RB'),
     ('nobody', 'NN'),
     (';', ':'),
     ('a', 'DT'),
     ('doer', 'JJ'),
     ('-', ':'),
     ('deciding', 'NN'),
     (',', ','),
     ('not', 'RB'),
     ('being', 'VBG'),
     ('decided', 'VBN'),
     ('for', 'IN'),
     (',', ','),
     ('self-directed', 'JJ'),
     ('and', 'CC'),
     ('not', 'RB'),
     ('acted', 'VBN'),
     ('upon', 'IN'),
     ('by', 'IN'),
     ('external', 'JJ'),
     ('nature', 'NN'),
     ('or', 'CC'),
     ('by', 'IN'),
     ('other', 'JJ'),
     ('men', 'NNS'),
     ('as', 'IN'),
     ('if', 'IN'),
     ('I', 'PRP'),
     ('were', 'VBD'),
     ('a', 'DT'),
     ('thing', 'NN'),
     (',', ','),
     ('or', 'CC'),
     ('an', 'DT'),
     ('animal', 'JJ'),
     (',', ','),
     ('or', 'CC'),
     ('a', 'DT'),
     ('slave', 'JJ'),
     ('incapable', 'NN'),
     ('of', 'IN'),
     ('playing', 'VBG'),
     ('a', 'DT'),
     ('human', 'JJ'),
     ('role', 'NN'),
     (',', ','),
     ('that', 'WDT'),
     ('is', 'VBZ'),
     (',', ','),
     ('of', 'IN'),
     ('conceiving', 'VBG'),
     ('goals', 'NNS'),
     ('and', 'CC'),
     ('policies', 'NNS'),
     ('of', 'IN'),
     ('my', 'PRP$'),
     ('own', 'JJ'),
     ('and', 'CC'),
     ('realising', 'VBG'),
     ('them', 'PRP'),
     ('.', '.'),
     ('This', 'DT'),
     ('is', 'VBZ'),
     ('at', 'IN'),
     ('least', 'JJS'),
     ('part', 'NN'),
     ('of', 'IN'),
     ('what', 'WP'),
     ('I', 'PRP'),
     ('mean', 'VBP'),
     ('when', 'WRB'),
     ('I', 'PRP'),
     ('say', 'VBP'),
     ('that', 'IN'),
     ('I', 'PRP'),
     ('am', 'VBP'),
     ('rational', 'JJ'),
     (',', ','),
     ('and', 'CC'),
     ('that', 'IN'),
     ('it', 'PRP'),
     ('is', 'VBZ'),
     ('my', 'PRP$'),
     ('reason', 'NN'),
     ('that', 'IN'),
     ('distinguishes', 'VBZ'),
     ('me', 'PRP'),
     ('as', 'IN'),
     ('a', 'DT'),
     ('human', 'JJ'),
     ('being', 'VBG'),
     ('from', 'IN'),
     ('the', 'DT'),
     ('rest', 'NN'),
     ('of', 'IN'),
     ('the', 'DT'),
     ('world', 'NN'),
     ('.', '.'),
     ('I', 'PRP'),
     ('wish', 'VBP'),
     (',', ','),
     ('above', 'IN'),
     ('all', 'DT'),
     ('.', '.'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('conscious', 'JJ'),
     ('of', 'IN'),
     ('myself', 'PRP'),
     ('as', 'IN'),
     ('a', 'DT'),
     ('thinking', 'NN'),
     (',', ','),
     ('willing', 'JJ'),
     (',', ','),
     ('active', 'JJ'),
     ('being', 'VBG'),
     (',', ','),
     ('bearing', 'VBG'),
     ('responsibility', 'NN'),
     ('for', 'IN'),
     ('my', 'PRP$'),
     ('choices', 'NNS'),
     ('and', 'CC'),
     ('able', 'JJ'),
     ('to', 'TO'),
     ('explain', 'VB'),
     ('them', 'PRP'),
     ('by', 'IN'),
     ('reference', 'NN'),
     ('to', 'TO'),
     ('my', 'PRP$'),
     ('own', 'JJ'),
     ('ideas', 'NNS'),
     ('and', 'CC'),
     ('purposes', 'NNS'),
     ('.', '.'),
     ('I', 'PRP'),
     ('feel', 'VBP'),
     ('free', 'JJ'),
     ('to', 'TO'),
     ('the', 'DT'),
     ('degree', 'NN'),
     ('that', 'IN'),
     ('I', 'PRP'),
     ('believe', 'VBP'),
     ('this', 'DT'),
     ('to', 'TO'),
     ('be', 'VB'),
     ('true', 'JJ'),
     (',', ','),
     ('and', 'CC'),
     ('enslaved', 'VBD'),
     ('to', 'TO'),
     ('the', 'DT'),
     ('degree', 'NN'),
     ('that', 'IN'),
     ('I', 'PRP'),
     ('am', 'VBP'),
     ('made', 'VBN'),
     ('to', 'TO'),
     ('realise', 'VB'),
     ('that', 'IN'),
     ('it', 'PRP'),
     ('is', 'VBZ'),
     ('not', 'RB'),
     ('.', '.')]




```
tree = chunkParser.parse(tagged)
for subtree in tree.subtrees():
    print(subtree)
```

    (S
      I/PRP
      wish/VBP
      my/PRP$
      (NP life/NN)
      and/CC
      decisions/NNS
      to/TO
      depend/VB
      on/IN
      myself/PRP
      ,/,
      not/RB
      on/IN
      external/JJ
      forces/NNS
      of/IN
      whatever/WDT
      (NP kind/NN)
      ./.
      I/PRP
      wish/VBP
      to/TO
      be/VB
      (NP the/DT instrument/NN)
      of/IN
      my/PRP$
      own/JJ
      ,/,
      not/RB
      of/IN
      other/JJ
      men/NNS
      's/POS
      ,/,
      acts/VBZ
      of/IN
      will/MD
      ./.
      I/PRP
      wish/VBP
      to/TO
      be/VB
      (NP a/DT subject/NN)
      ,/,
      not/RB
      (NP an/DT object/NN)
      ;/:
      to/TO
      be/VB
      moved/VBN
      by/IN
      reasons/NNS
      ,/,
      by/IN
      conscious/JJ
      purposes/NNS
      ,/,
      which/WDT
      are/VBP
      my/PRP$
      own/JJ
      ,/,
      not/RB
      by/IN
      causes/NNS
      which/WDT
      affect/VBP
      me/PRP
      ,/,
      as/IN
      it/PRP
      were/VBD
      ,/,
      from/IN
      outside/JJ
      ./.
      I/PRP
      wish/VBP
      to/TO
      be/VB
      (NP somebody/NN)
      ,/,
      not/RB
      (NP nobody/NN)
      ;/:
      a/DT
      doer/JJ
      -/:
      (NP deciding/NN)
      ,/,
      not/RB
      being/VBG
      decided/VBN
      for/IN
      ,/,
      self-directed/JJ
      and/CC
      not/RB
      acted/VBN
      upon/IN
      by/IN
      (NP external/JJ nature/NN)
      or/CC
      by/IN
      other/JJ
      men/NNS
      as/IN
      if/IN
      I/PRP
      were/VBD
      (NP a/DT thing/NN)
      ,/,
      or/CC
      an/DT
      animal/JJ
      ,/,
      or/CC
      (NP a/DT slave/JJ incapable/NN)
      of/IN
      playing/VBG
      (NP a/DT human/JJ role/NN)
      ,/,
      that/WDT
      is/VBZ
      ,/,
      of/IN
      conceiving/VBG
      goals/NNS
      and/CC
      policies/NNS
      of/IN
      my/PRP$
      own/JJ
      and/CC
      realising/VBG
      them/PRP
      ./.
      This/DT
      is/VBZ
      at/IN
      least/JJS
      (NP part/NN)
      of/IN
      what/WP
      I/PRP
      mean/VBP
      when/WRB
      I/PRP
      say/VBP
      that/IN
      I/PRP
      am/VBP
      rational/JJ
      ,/,
      and/CC
      that/IN
      it/PRP
      is/VBZ
      my/PRP$
      (NP reason/NN)
      that/IN
      distinguishes/VBZ
      me/PRP
      as/IN
      a/DT
      human/JJ
      being/VBG
      from/IN
      (NP the/DT rest/NN)
      of/IN
      (NP the/DT world/NN)
      ./.
      I/PRP
      wish/VBP
      ,/,
      above/IN
      all/DT
      ./.
      to/TO
      be/VB
      conscious/JJ
      of/IN
      myself/PRP
      as/IN
      (NP a/DT thinking/NN)
      ,/,
      willing/JJ
      ,/,
      active/JJ
      being/VBG
      ,/,
      bearing/VBG
      (NP responsibility/NN)
      for/IN
      my/PRP$
      choices/NNS
      and/CC
      able/JJ
      to/TO
      explain/VB
      them/PRP
      by/IN
      (NP reference/NN)
      to/TO
      my/PRP$
      own/JJ
      ideas/NNS
      and/CC
      purposes/NNS
      ./.
      I/PRP
      feel/VBP
      free/JJ
      to/TO
      (NP the/DT degree/NN)
      that/IN
      I/PRP
      believe/VBP
      this/DT
      to/TO
      be/VB
      true/JJ
      ,/,
      and/CC
      enslaved/VBD
      to/TO
      (NP the/DT degree/NN)
      that/IN
      I/PRP
      am/VBP
      made/VBN
      to/TO
      realise/VB
      that/IN
      it/PRP
      is/VBZ
      not/RB
      ./.)
    (NP life/NN)
    (NP kind/NN)
    (NP the/DT instrument/NN)
    (NP a/DT subject/NN)
    (NP an/DT object/NN)
    (NP somebody/NN)
    (NP nobody/NN)
    (NP deciding/NN)
    (NP external/JJ nature/NN)
    (NP a/DT thing/NN)
    (NP a/DT slave/JJ incapable/NN)
    (NP a/DT human/JJ role/NN)
    (NP part/NN)
    (NP reason/NN)
    (NP the/DT rest/NN)
    (NP the/DT world/NN)
    (NP a/DT thinking/NN)
    (NP responsibility/NN)
    (NP reference/NN)
    (NP the/DT degree/NN)
    (NP the/DT degree/NN)
    

#### References:

https://pythonprogramming.net/chunking-nltk-tutorial/
https://nlpforhackers.io/category/nltk/




```

```
