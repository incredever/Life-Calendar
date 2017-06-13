# Editing Branching and submitting pull requests


Hello! This is a quick outline of the rules we should try to follow while collaborating on this project.

Things can get messy quickly with a bunch of folks all working on the same codebase. So while we scramble to build features and squash bugs let's try to follow a strategy for avoiding tangled merge conflicts, duplicating work, and general stepping-on-the-toes of our fellow developers.

The first, and most important thing is that **all work must be done against an issue, and on its own branch**.

So the first steps before doing anything will always be:

1. Create or assign yourself an issue from the GitHub issue tracker.
2. Create a branch, and check it out before editing files.

The good news is that, if you follow these steps, it is very unlikely you will mess anything up. So go crazy!

## Creating issues

Issues server a few purposes. The first one is so our product managers can track progress and get an overview of what in progress, and what needs to get done.

Second, we don't want to developers unwittingly working on the same task. Issues can be assigned and reassigned to team members. So if you've hit a wall with the issue, assign it to whomever can move it along. And they'll reassign it back to you if need be.

Please check first before making a new issue, on the off chance one already exists.

Third, the comment section is an ideal place to discuss and troubleshoot the problems while tackling the task. If you need more information, or could use some help, don't be afraid to @mention your team members. But even if you're working solo, issue comments can be nice a [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging). I like to write down everything I'm thinking so I can more easily pick it back up.

#### Labels
Issues can have labels. We will probably end up using them for things, but for now there are no rules. Use them however feels natural.

Same goes for Milestones and Projects. Lets see what the project requires as things play out.

## Branching

* Master
* Develop
* Issue-1-Example-issue-branch
* Issue-2-Another-example-issue
* Issue-3-Create-that-awesome-feature

Develop is your main hub. It's the latest functioning version of the app – with all the finished work that has yet to make it to production. All issue branches merge into develop. We will publish our beta releases from the Develop branch. I will write another wiki page all about that later.

Master is the current code in production. This will make it easy for use to checkout what the production code looks like, and compare to our current work. Develop merges into master when we're ready to push a new version of the app to the world.

Issue branches contain all the work we do. They get merged up to Develop after being submitted and reviewed in Pull Request. Issue branches should begin with "Issue", followed by the issue number, followed by a brief description of what the branch is building or fixing.

It's probably best to branch off of Develop for your issue branches. Develop is where all the latest action is.

## Submitting pull requests

Please **do not** just merge your issue branches into develop (and *never* directly to master) unless you're sure it's not something the team should review before it goes into play. Almost always create a Pull Request and assign one or more of your team members to take a look.

For a PR to be accepted it must meet the following criteria:

- [ ] Compiles and runs
- [ ] All tests must pass
- [ ] All merge conflicts with Develop must be resolved
- [ ] Solves the problem stated in the respective issue
- [ ] Has been reviewed by at least one other developer

If the reviewer has any comments, or notices it does not meet all of the requirements listed above, it is the submitters job to make any necessary changes - but, as always, ask for help early and often. I think it's safe to say your team members are always open to jumping on Slack or a Hangout to lend a hand.

Note: When you make changes to a branch which has already been submitted, the PR will automatically reflect those changes. No need to resubmit.
