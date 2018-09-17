import time

while True:
    with open('/proc/meminfo') as f:
        meminfo = dict([_.split(':') for _ in f.read().replace('kB', '').replace(' ', '').split()])
    memTotal = float(meminfo.get('MemTotal').split(' ')[0]) / 1024
    memAvailable = float(meminfo.get('MemAvailable').split(' ')[0]) / 1024
    memUsage = memTotal - memAvailable
    swapTotal = float(meminfo.get('SwapTotal').split(' ')[0]) / 1024
    swapFree = float(meminfo.get('SwapFree').split(' ')[0]) / 1024
    swapUsage = swapTotal - swapFree
    with open('/dev/shm/mem', mode='w') as f:
        f.write(' RAM: %5.2f MB / %5.2f MB\nSWAP:%5.2f MB / %5.2f MB' % (memUsage, memTotal, swapUsage, swapTotal))
    time.sleep(1)