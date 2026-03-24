# AST Node Definitions and Function Declarations

#ifndef AST_H
#define AST_H

// Define the structure for an AST node.
typedef struct ASTNode {
    int type; // Type of the node (e.g., variable, operation, etc.)
    struct ASTNode* left;
    struct ASTNode* right;
} ASTNode;

// Function declarations for building and printing the AST.
ASTNode* createNode(int type, ASTNode* left, ASTNode* right);
void printAST(ASTNode* node);

#endif // AST_H
