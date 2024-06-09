
#define MAGIC_NUM 211502008
#define uintptr_t unsigned
#define NULL 0
#define uint32_t unsigned
#define MAX(a, b) ((a > b) ? a : b)
#define heap_start (0xb0000000)
#define heap_end (0xb0000000 + 128 * 1024)
#define size_t unsigned

unsigned int umul(unsigned int a, unsigned int b) {
    unsigned int result = 0;
    while (b) {
        result += (b & 1) ? a : 0;
        a <<= 1;
        b >>= 1;
    }
    return result;
}
unsigned int udiv(unsigned int a,
                  unsigned int b) { // a/b
    unsigned int result = 0;
    unsigned ptr = 1 << 31;
    unsigned long long int x = (unsigned long long int)b << 31;
    unsigned long long int A = (unsigned long long int)a;
    while (ptr != 0) {
        if (A >= x) {
            A -= x;
            result += ptr;
        }
        x >>= 1;
        ptr >>= 1;
    }
    return result;
}
unsigned int umod(unsigned int a,
                  unsigned int b) { // a%b
    return a - umul(udiv(a, b), b);
}

typedef struct console {
    char *data;
    int ptr;
    int size, line_size;
} console;

void console_clear(console *con) {
    con->ptr = 0;
    for (int i = 0; i < con->size; i++) {
        *(con->data + i) = 0;
    }
}

void console_putc(console *con, char c) {
    if (con->ptr < con->size) {
        if (c == '\n' && con->size - con->ptr > con->line_size) {
            con->ptr = umod((con->ptr + con->line_size), con->line_size);
        } else {
            *(con->data + con->ptr) = c;
            con->ptr++;
        }
    }
}

int print_int(console *con, unsigned x) {
    int ret;
    if (x != 0)
        ret = print_int(con, udiv(x, 10));
    else
        return 0;
    console_putc(con, umod(x, 10) + '0');
    return ret + 1;
}

#define SEP_SIZE(head_ptr)                                                     \
    (udiv(head_ptr->size + (uintptr_t)sizeof(node_head)), 2) - sizeof(node_head)

#define NODE_HEAD(_ptr)                                                        \
    (node_head *)((uintptr_t)(_ptr) - (uintptr_t)sizeof(node_head))
#define MEM_HEAD(_head_ptr)                                                    \
    (void *)((uintptr_t)(_head_ptr) + (uintptr_t)sizeof(node_head))

#define IN_LIST(_X)                                                            \
    ((uintptr_t)_X->pred != (uintptr_t)MAGIC_NUM &&                            \
     (uintptr_t)_X->succ != (uintptr_t)MAGIC_NUM)
#define NOT_IN_LIST(_X)                                                        \
    ((uintptr_t)_X->pred == (uintptr_t)MAGIC_NUM &&                            \
     (uintptr_t)_X->succ == (uintptr_t)MAGIC_NUM)
#define IN_HEAP(_X)                                                            \
    ((uintptr_t)heap_start <= (uintptr_t)_X &&                                 \
     (uintptr_t)_X + (uintptr_t)MIN_BLOCKSIZE < (uintptr_t)heap_end)

static uintptr_t heap_size = 0;
static uintptr_t page_size = 4096;
static uintptr_t MIN_BLOCKSIZE = 0;

static inline void atomic_write_int(uintptr_t *N, uintptr_t val) { *N = val; }

typedef struct queue queue;
typedef struct node_head {
    uintptr_t size;
    struct node_head *pred, *succ;
    queue *father_que;
} node_head;

typedef struct queue {
    node_head *head, *tail;
    uintptr_t len;
} queue;

queue memblock_queue[32] = {};
uint32_t max_order;

static inline uint32_t next_power_of_2(int n) {
    n--;
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    n++;
    return n;
}

static uintptr_t available_mem = 0;

static inline void delete_node(node_head *ptr) {
    if (ptr != NULL) {
        queue *father_que = ptr->father_que;
        father_que->len--;
        node_head *pred = ptr->pred, *succ = ptr->succ;
        if (ptr == father_que->head)
            father_que->head = ptr->succ;
        if (ptr == father_que->tail)
            father_que->tail = ptr->pred;
        if (pred != NULL) {
            pred->succ = succ;
        }
        if (succ != NULL) {
            succ->pred = pred;
        }
        ptr->pred = (node_head *)MAGIC_NUM;
        ptr->succ = (node_head *)MAGIC_NUM;
        atomic_write_int((uintptr_t *)&(ptr->father_que), 0);
    }
}

static inline node_head *list_pop(queue *Q) {
    node_head *pop_node = Q->head;
    delete_node(pop_node);
    return pop_node;
}

static inline void list_push(queue *Q, node_head *NN) {
    if (Q->head == NULL || Q->len == 0) {
        Q->head = NN;
        Q->tail = NN;
        NN->pred = NULL;
        NN->succ = NULL;
    } else {
        NN->pred = Q->tail;
        Q->tail->succ = NN;
        NN->succ = NULL;
        Q->tail = NN;
    }
    Q->len++;
    NN->father_que = Q;
}

static inline uint32_t get_buddyOrd(uintptr_t size) {
    uintptr_t blk_size = next_power_of_2(size);
    uint32_t order = 0;
    for (; blk_size > MIN_BLOCKSIZE; blk_size >>= 1) {
        order++;
    }
    return order;
}

static node_head *buddySys_merge(node_head *node) {
    uint32_t size = next_power_of_2(node->size + sizeof(node_head));
    uint32_t order = get_buddyOrd(size);
    if (size >= umul(32, (1 << 20)) ||
        ((uintptr_t)MEM_HEAD(node) ^ size) == 0) {
        node->pred = (node_head *)MAGIC_NUM;
        node->succ = (node_head *)MAGIC_NUM;
        return node;
    }
    node_head *buddy_node = NODE_HEAD((uintptr_t)MEM_HEAD(node) ^ size),
              *new_node;
    if (IN_HEAP(buddy_node) && IN_LIST(buddy_node) &&
        (&memblock_queue[order] == buddy_node->father_que)) {
        delete_node(buddy_node);
        if ((uintptr_t)buddy_node < (uintptr_t)node) {
            new_node = buddy_node;
        } else {
            new_node = node;
        }
        node->pred = NULL;
        node->succ = NULL;
        buddy_node->pred = NULL;
        buddy_node->succ = NULL;
        new_node->size = umul(2, node->size) + sizeof(node_head);
        new_node->pred = (node_head *)MAGIC_NUM;
        new_node->succ = (node_head *)MAGIC_NUM;
        return buddySys_merge(new_node);
    } else {
        node->pred = (node_head *)MAGIC_NUM;
        node->succ = (node_head *)MAGIC_NUM;
        return node;
    }
}
static void buddySys_free(void *ptr) {
    node_head *node_ptr = NODE_HEAD(ptr);
    node_head *after_merge = buddySys_merge(node_ptr);
    uint32_t order = get_buddyOrd(after_merge->size + sizeof(node_head));
    list_push(&memblock_queue[order], after_merge);
}

static node_head *buddy_sep(node_head *blk, uintptr_t to_ord) {
    uint32_t order = get_buddyOrd(blk->size + sizeof(node_head));
    if (order == to_ord) {
        blk->father_que = NULL;
        blk->pred = (node_head *)MAGIC_NUM;
        blk->succ = (node_head *)MAGIC_NUM;
        return blk;
    }
    node_head *NN = (node_head *)((uintptr_t)blk +
                                  (((uintptr_t)blk->size +
                                    udiv((uintptr_t)sizeof(node_head), 2))));
    NN->size = udiv(((uintptr_t)blk->size + (uintptr_t)sizeof(node_head)), 2) -
               sizeof(node_head);
    NN->pred = (node_head *)MAGIC_NUM;
    NN->succ = (node_head *)MAGIC_NUM;
    blk->size = NN->size;
    list_push(&memblock_queue[order - 1], NN);
    return buddy_sep(blk, to_ord);
}

static void *buddySys_alloc(size_t size) {
    const uint32_t order = get_buddyOrd(size + sizeof(node_head));
    node_head *ret = NULL;
    if (memblock_queue[order].len == 0) {
        for (int i = order + 1; i <= max_order; i++) {
            if (memblock_queue[i].len != 0) {
                node_head *SN = list_pop(&memblock_queue[i]);
                ret = buddy_sep(SN, order);
                break;
            } else {
            }
        }
    } else {
        ret = list_pop(&memblock_queue[order]);
    }
    if (IN_HEAP(ret))
        return MEM_HEAD(ret);
    else
        return NULL;
}

static void *kalloc(size_t size) {
    // spin_lock(&BIG_LK);
    void *ret = buddySys_alloc(size);
    // spin_unlock(&BIG_LK);
    return ret;
}

static void kfree(void *ptr) {
    // spin_lock(&BIG_LK);
    buddySys_free(ptr);
    // spin_unlock(&BIG_LK);
}

static void pmm_init() {
    MIN_BLOCKSIZE = next_power_of_2(sizeof(node_head) + 1);

    uintptr_t pmsize = ((uintptr_t)heap_end - (uintptr_t)heap_start);
    heap_size = pmsize;
    // 每个块至少MIN_BLOCKSIZE字节
    for (uintptr_t i = (uintptr_t)heap_start + page_size;
         i < (uintptr_t)heap_end; i++) {
        if (umod((uintptr_t)MEM_HEAD(i), MIN_BLOCKSIZE) == 0 &&
            (uintptr_t)i + MIN_BLOCKSIZE < (uintptr_t)heap_end) {
            uintptr_t size = MIN_BLOCKSIZE;
            int order = 0;
            while (umod((uintptr_t)MEM_HEAD(i), size) == 0 &&
                   (uintptr_t)i + size < (uintptr_t)heap_end &&
                   size <= umul(32, (1 << 20))) {
                size = size << 1;
                order++;
            }
            size = size >> 1;
            order--;
            max_order = MAX(order, max_order);
            node_head *new_block = (node_head *)i;
            new_block->size = size - sizeof(node_head);
            atomic_write_int((uintptr_t *)&(new_block->father_que),
                             (uintptr_t)&memblock_queue[order]);
            new_block->pred = (node_head *)MAGIC_NUM;
            new_block->succ = (node_head *)MAGIC_NUM;
            list_push(&(memblock_queue[order]), new_block);
            available_mem += new_block->size;
            i += size - 1;
        }
    }
}

int main() {
    char *buffer = kalloc(500);
    console con0;
    con0.data = (char *)0xa0000000;
    con0.ptr = 0;
    con0.size = 2400;
    con0.line_size = 80;
    while (1) {
        for (int i = 0; i < 500; i++) {
            buffer[i] = 'a' + umod(i, 26);
        }
        for (int i = 0; i < 500; i++) {
            console_putc(&con0, buffer[i]);
        }
        console_clear(&con0);
    }
}