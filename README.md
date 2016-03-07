Template
========

An Emacs extension for creating project templates (Currently based on [Giter8] )


### Requirements

* Emacs 24.3 or higher, (has been tested on 24.3.1)
* Set up [https://github.com/n8han/giter8]  (SBT, etc)
 
```sh
$ g8 [arguments]   => this command being used by emacs
```

### Installation

* This package is available on marmalade repo, so you need to add it to your repo list and after that :
```sh
M-x package-install [RET] template [RET]
```
* add this line to your .emacs => (require 'template)

### How to use

All you need is "create-project" command in Emacs which asks you to enter your g8 template name.
for example "typesafehub/scala-sbt".


### Free Software ?
hell yeah it's GPL.












[Giter8]:https://github.com/n8han/giter8
