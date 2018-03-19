 function RandomListNode(label) {
      this.label = label;
     this.next = this.random = null;
 }

let copyRandomList = function (head) {
    let seen = [];
    // console.log(head)
    let current = head;
    let recurse = function (current) {
        if (!current) {
            return null;
        }
        seen.push(current);
        let newHead = new RandomListNode(current.label);
        if (seen.includes(current.next)) {
            newHead.next = null;
        }
        else {
            newHead.next = recurse(current.next);
        }
        if (seen.includes(current.random)) {
            newHead.random = null;
        } else {
            newHead.random = recurse(current.random);
        }
        return newHead;
    };

    let newHead = recurse(current);
    let currentNodes = [];
    let newNodes = [];
    current = head;
    let newCurrent = newHead;
    while (current && newCurrent) {
        currentNodes.push(current);
        newNodes.push(newCurrent);
        current = current.next;
        newCurrent = newCurrent.next;
    }
    let i = 0;
    while (i < currentNodes.length) {
        newCurrent = newNodes[i];
        current = currentNodes[i];
        if (!newCurrent.next && current.next) {
            newCurrent.next = newNodes[currentNodes.indexOf(current.next)];
        }
        if (!newCurrent.random && current.random) {
            newCurrent.random = newNodes[currentNodes.indexOf(current.random)];
        }
        i++;
    }
    return newHead;
};