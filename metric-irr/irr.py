import sys

objects = set()
req_count = 0

# format
# ObjectId
for obj in sys.stdin.readlines():
	req_count += 1
	objects.add(obj)

irr = (req_count - len(obj))/req_count
print(irr)