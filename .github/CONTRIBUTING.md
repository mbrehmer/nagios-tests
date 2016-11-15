# How to contribute #

Those who want to contribute to this repository have to obey the following conventions.<br/>
Code or commits that don't, will not be accepted.

## Submitting changes ##

Please send a [GitHub Pull Request to this repository](https://github.com/mbrehmer/nagios-tests/pull/new)
with a clear list of what you have done (read more about [pull requests](http://help.github.com/pull-requests/)).<br/>
Follow the branching-, committing- and coding conventions below.

## Branching conventions ##

* **Always** do your work on feature branches and follow the Workrflow for working with feature branches.
* **Always** make **this repository** your additional upstream repository.<br/>
You can do that this way:
```
$ git remote add upstream https://github.com/mbrehmer/nagios-tests.git
```
* **Always** clone/fork the branch develop, instead of master. master is reserved for stable code only.
* **Never** merge your feature branches as fast-forward merges into the develop branch.<br/>
If you have finished a feature branch and want to merge it into your master branch, do it this way:
```
$ git checkout develop
$ git pull --ff-only upstream/develop
$ git merge --no-ff feature-a -m "[ADD] feature a"
```

## Committing conventions ##
Your commit messages have to be in the following format:

1. A short description (**single line of max. 50 characters**), starting with one of the following tags:
   * [ADD] for code additions
   * [DEL] for code deletions
   * [CHG] for code changes
   * [FIX] for code fixes
2. An empty line (**very important**)
3. A detailed description (**max. 80 characters per line**)

The detailed description and the empty line may be left out, if the commit only includes minor changes, like typo corrections.<br/>
Every other commit **has to include the empty line and the detailed description**.

## Coding conventions ##

* Intend using tabs, **not spaces**.
* This is open source software.
Consider the people who will read your code, and make it look nice for them.
It's sort of like driving a car: Perhaps you love doing donuts when you're alone,
but with passengers the goal is to make the ride as smooth as possible.
* Always use cwd-relative paths rather than root-relative paths.
* Write shell scripts for the Bourne-again shell (bash).
