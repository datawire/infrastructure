#!/usr/bin/env python3

import os

from github3 import login

github = login(os.getenv('GH_USERNAME'), token=os.getenv('GH_TOKEN'))

(owner, repo) = os.getenv('TRAVIS_REPO_SLUG').split('/')
pr = github.pull_request(owner, repo, int(os.getenv('TRAVIS_PULL_REQUEST')))

with open('plan.show') as f:
    plan = f.read()
    msg = """
Please review the following changes carefully before approving the pull request and merging!
    
```
{}
```
""".format(plan)

    pr.create_comment(msg)
