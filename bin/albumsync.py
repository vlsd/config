from subprocess import call

path = files[0].split('/')[-3:-1]
album = path[0]+'/'+path[1]+'/'
destination = "/Volumes/NO NAME/Music/"
call(['mkdir','-p',destination+album])
call(['rsync','-t'] + files + ['*.jpg','*.jpeg'] + [destination+album])
