import time

last_idle = last_total = 0
while True:
    with open('/proc/stat') as f:
        fields = [float(column) for column in f.readline().strip().split()[1:]]
    idle, total = fields[3], sum(fields)
    idle_delta, total_delta = idle - last_idle, total - last_total
    last_idle, last_total = idle, total
    utilisation = 100.0 * (1.0 - idle_delta / total_delta)
    with open('/proc/loadavg') as f:
        loadavg = [_ for _ in f.readline().strip().split(' ')]
    with open('/dev/shm/cpu', mode='w') as f:
        f.write(' LA: %s %s %s\nCPU: %3.2f%%' % (loadavg[0], loadavg[1], loadavg[2], utilisation))
    time.sleep(1)