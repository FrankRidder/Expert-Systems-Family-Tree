
# Expert Systems Prolog Example
This system is enirly gender free and supports that a child can have 1 or more parents.   

The system uses forward chaining to find the parent of a child.   
The system uses backward chaining to find the child of a parent.  
## Dependencies
Download and install SWI-Prolog from [here](https://www.swi-prolog.org/download/stable).  

SWI-Prolog is a free implementation of the programming language Prolog, commonly used for teaching and semantic web applications. It has been under continuous development since 1987. Its main author is Jan Wielemaker.
## Usage  
To define a child and parent use within the family.pl file:
```
parent(child, parent).
```
Go to the project folder and use `swipl` while in a terminal to access SWI-Prolog.
While in `swipl` use `[family].` to load in the family tree file.


After setting up your family tree with these parent child relationships you can use the following statments to query the tree:
To get the parents of X use (e.g frank):
```
parents(frank, Who).
```
To get the grandparents of X use (e.g frank):
```
grandparents(frank, Who1, Who2).
```
To get the siblings of X use (e.g willem):
```
siblings(willem, Who).
```
To get the ancestors of X use (e.g frank):
```
ancestors(frank, Who).
```
To get the offspring of X use (e.g willem):
```
offspring(willem, Who).
```
To get the spouse of X use (e.g willem):
```
spouse(willem, Who).
```
To get the siblings of parents of X use (e.g frank):
```
siblings_of_parents(frank, Who).
```
To get the cousins of X use (e.g frank):
```
cousins(frank, Who).
```
