import subprocess
import re


def find_password():
    cmd = ['security', 'find-internet-password',
           '-g', '-a', 'mstrzele', '-s', 'github.com']
    pwinfo = subprocess.Popen(cmd, stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)
    pwline = pwinfo.stderr.read().strip()
    return re.sub('password: "(.*)"', '\\1', pwline)


PASSWORD = find_password()
USERNAME = 'mstrzele'
