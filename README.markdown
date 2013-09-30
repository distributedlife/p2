# P2 Magazine
## How to push to your own staging

1. Fork the `distributedlife/p2` repository
1. Checkout `your_fork/p2` and make sure `origin` is the name of the remote
1. Ensure there is a branch called `gh-pages` in your new fork
1. **be careful**: The script `rm -rf *` the `../public` and `../redirects` folder from wherever `publish.sh` is called. Make sure you don't have such folders.
1. `./publish.sh "some commit message"`
 - This script will call `rake generate`
 - It will delete the `../public` and `../redirects` folders
 - It will then copy `public` and `redirects` up a directory
 - It will then checkout the `gh-pages` branch
 - It does a `pull --rebase`
 - It will `rm -rf *` the entire repo
 - It will copy back in the `public` and `redirects`
 - It adds all the things into the repo
 - It makes a commit using your message
 - It pushes to `origin gh-pages`
 - It checks out source.

# How to push to PRODUCTION
We publish a new issue on the first Tuesday of each month.

1. Make sure you have push rights to `thoughtworks/p2`
1. Add a remote called `tw` that goes to `thoughtworks/p2`
1. Run the `./to_prod_and_beyond.sh`. It's exactly the same as the `publish.sh` script except the repo is hard-coded to `tw gh-pages`