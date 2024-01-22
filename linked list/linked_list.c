#include <stdio.h>
#include <stdlib.h>

// Define the structure for a node in the linked list
struct Node {
    int data;
    struct Node* next;
};

// Function to create a new node with a given value
struct Node* create_node(int value) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    if (new_node == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }
    new_node->data = value;
    new_node->next = NULL;
    return new_node;
}

// Function to set the value of a node
void set_value(struct Node* node, int value) {
    if (node != NULL) {
        node->data = value;
    } else {
        fprintf(stderr, "Node is NULL\n");
    }
}

// Function to get the value of a node
int get_value(struct Node* node) {
    if (node != NULL) {
        return node->data;
    } else {
        fprintf(stderr, "Node is NULL\n");
        return -1; // You can choose a default value or handle it differently
    }
}

// Function to set the next pointer of a node
void set_next(struct Node* node, struct Node* next_node) {
    if (node != NULL) {
        node->next = next_node;
    } else {
        fprintf(stderr, "Node is NULL\n");
    }
}

// Function to get the next pointer of a node
struct Node* get_next(struct Node* node) {
    if (node != NULL) {
        return node->next;
    } else {
        fprintf(stderr, "Node is NULL\n");
        return NULL;
    }
}

// Function to delete a node from the list
void delete_node(struct Node* head, struct Node* target) {
    struct Node* current = head;
    struct Node* previous = NULL;

    while (current != NULL && current != target) {
        previous = current;
        current = current->next;
    }

    if (current == NULL) {
        fprintf(stderr, "Node not found in the list\n");
        return;
    }

    if (previous == NULL) {
        // If the target node is the head
        head = current->next;
    } else {
        // If the target node is not the head
        previous->next = current->next;
    }

    free(current);
}

// Function to print the elements of the linked list
void print_list(struct Node* head) {
    struct Node* current = head;
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");
}

// Function to free the memory allocated for the linked list
void free_list(struct Node* head) {
    struct Node* current = head;
    struct Node* next = NULL;
    while (current != NULL) {
        next = current->next;
        free(current);
        current = next;
    }
}

int Example() {
    // Example usage
    struct Node* head = create_node(1);
    struct Node* second = create_node(2);
    struct Node* third = create_node(3);

    set_next(head, second);
    set_next(second, third);

    print_list(head);

    printf("Value at second node: %d\n", get_value(second));

    // Delete the second node
    delete_node(head, second);

    print_list(head);

    // Free the memory allocated for the linked list
    free_list(head);

    return 0;
}


int main(){

    
    return 0;
}