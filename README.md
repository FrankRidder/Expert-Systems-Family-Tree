
# Expert Systems Prolog Example
## Dependencies
Download and install SWI-Prolog from [here](https://www.swi-prolog.org/download/stable).  

## Usage  
To define a child and parent use within the family.pl file:
```
parent(child, parent).
```
Go to the project folder in and use `swipl` while in a terminal to access SWI-Prolog.
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
spouse(frank, Who).
```
