#!/bin/sh
sshfs vlad@vlebian:/home/vlad/ /Users/vlad/remote -oauto_cache,reconnect,defer_permissions,negative_vncache
