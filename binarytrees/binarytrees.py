import sys, time

class TreeNode():
    def __init__(self, left, right, item):
        self.left = left
        self.right = right
        self.item = item

    @classmethod
    def create(cls, item, depth = 0):
        if depth > 0:
            left = cls.create(2 * item - 1, depth - 1)
            right = cls.create(2 * item, depth - 1)
            return cls(left, right, item)
        else:
            return cls(None, None, item)

    def check(self):
        if not self.left:
            return self.item
        else:
            return self.item + self.left.check() - self.right.check()

def main():
    t = time.time()
    min_depth = 4
    max_depth = max(min_depth + 2, int(sys.argv[1]))
    stretch_depth = max_depth + 1

    print("stretch tree of depth %d\t check: %d" % (stretch_depth, TreeNode.create(0, stretch_depth).check()))

    long_lived_tree = TreeNode.create(0, max_depth)

    iterations = int(2**max_depth)
    for depth in range(min_depth, stretch_depth, 2):

        check = 0
        for i in range(1, int(iterations + 1)):
            check += TreeNode.create(i, depth).check() + TreeNode.create(-i, depth).check()

        print("%d\t trees of depth %d\t check: %d" % (iterations * 2, depth, check))
        iterations /= 4

    print("long lived tree of depth %d\t check: %d" % (max_depth, long_lived_tree.check()))
    sys.stderr.write("time({0})\n".format(time.time() - t))

main()
