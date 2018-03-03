# git builder
# Push tags to remote
# git push origin --tags

import subprocess

cmd = ['git', 'log' ]

logs = subprocess.Popen(cmd, stdout = subprocess.PIPE)
out = logs.stdout.readlines()
print(out)


