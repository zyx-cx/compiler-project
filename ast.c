// ast.c
#include <stdio.h>
#include <stdlib.h>

// AST node structure
typedef struct ASTNode {
    int value;
    struct ASTNode* left;
    struct ASTNode* right;
} ASTNode;

// Function to create a new AST node
ASTNode* createNode(int value) {
    ASTNode* newNode = (ASTNode*)malloc(sizeof(ASTNode));
    newNode->value = value;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Function for pre-order traversal of the AST
void preOrderTraversal(ASTNode* node) {
    if (node == NULL) return;
    printf("%d ", node->value);
    preOrderTraversal(node->left);
    preOrderTraversal(node->right);
}

// Function to free the AST nodes
void freeAST(ASTNode* node) {
    if (node == NULL) return;
    freeAST(node->left);
    freeAST(node->right);
    free(node);
}

int main() {
    // Example usage:
    ASTNode* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    preOrderTraversal(root);
    // Free the allocated memory
    freeAST(root);
    return 0;
}