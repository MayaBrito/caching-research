import sys

objects = set()
req_count = 0

# format
# ObjectId
for line in sys.stdin.readlines():
        req_count += 1
        objects.add(line)
print("footprint,requests")
print(len(objects),req_count)