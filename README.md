# Docker Debian Git Server
This image contains a minimal git server, with `openssh-server` and `git` installed.

## Usage
For security reasons, I haven't set a password for the `git` user, so you'll
have to mount in an `authorized_keys` file with your public key to
`/home/git/.ssh/authorized_keys`.

I typically run the following:

```bash
docker run \
  --rm \
  -p 2222:22 \
  -v "$(pwd)/authorized_keys:/home/git/.ssh/authorized_keys" \
  --restart always \
  gitserver
```
